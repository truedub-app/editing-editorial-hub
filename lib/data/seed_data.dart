import 'package:drift/drift.dart';

import 'database/app_database.dart';

const _shiftCodes = [
  ('M', 'Morning shift', '08:00', '16:00', '#3B82F6'),
  ('A', 'Afternoon shift', '16:00', '00:00', '#3B82F6'),
  ('N', 'Night shift', '00:00', '08:00', '#3B82F6'),
  ('OFF', 'Rest day', null, null, '#94A3B8'),
  ('HOL', 'Annual holiday', null, null, '#F59E0B'),
  ('TOIL', 'Time off in lieu', null, null, '#F59E0B'),
  ('SICK', 'Sick leave', null, null, '#EF4444'),
];

const _categories = [
  ('Editorial Guidelines', '#3B82F6', 'edit_note'),
  ('Segmentation', '#39C66D', 'table_chart_outlined'),
  ('Editing & Post', '#F4C542', 'movie_edit_outlined'),
  ('Walkthroughs', '#A855F7', 'play_circle_outline'),
  ('Workflow', '#F59E0B', 'sync_alt'),
  ('QC', '#14B8A6', 'fact_check_outlined'),
  ('Compliance', '#EF4444', 'gavel_outlined'),
  ('Scheduling', '#38BDF8', 'event_note_outlined'),
];

/// First-run seed: shift-code dictionary, manual categories/documents, and a
/// few clearly-marked sample Segmentation Map rows. Contacts and staff are
/// deliberately left empty — they're populated by the ROTA import itself so
/// nothing fictional ends up looking like real department data.
Future<void> seedIfNeeded(AppDatabase db) async {
  final already = await (db.select(db.appSetting)..where((t) => t.key.equals('seeded')))
      .getSingleOrNull();
  if (already != null) return;

  await db.batch((batch) {
    batch.insertAllOnConflictUpdate(
      db.shiftCode,
      [
        for (final (code, label, start, end, color) in _shiftCodes)
          ShiftCodeCompanion.insert(
            code: code,
            label: label,
            hoursStart: Value(start),
            hoursEnd: Value(end),
            colorHex: Value(color),
          ),
      ],
    );
  });

  final categoryIds = <String, int>{};
  for (final (name, color, icon) in _categories) {
    final id = await db.into(db.manualCategory).insert(
          ManualCategoryCompanion.insert(name: name, colorHex: color, icon: icon),
        );
    categoryIds[name] = id;
  }

  final now = DateTime.now();
  Future<void> addDoc({
    required String title,
    required String category,
    required String fileType,
    String? reference,
    String? version,
    String? description,
    int? pageCount,
    int? durationSeconds,
    String? bodyText,
    String? owningTeam,
  }) async {
    await db.into(db.manualDocument).insert(ManualDocumentCompanion.insert(
          title: title,
          categoryId: categoryIds[category]!,
          reference: Value(reference),
          version: Value(version),
          description: Value(description),
          fileType: fileType,
          pageCount: Value(pageCount),
          durationSeconds: Value(durationSeconds),
          bodyText: Value(bodyText),
          owningTeam: Value(owningTeam),
          createdAt: now,
          updatedAt: now,
        ));
  }

  await addDoc(
    title: 'Content Editorial Guidelines — Summary (Arabic)',
    category: 'Editorial Guidelines',
    fileType: 'pdf',
    reference: 'P009',
    version: 'V5',
    description: 'Arabic editorial guidance and content standards.',
    pageCount: 16,
    owningTeam: 'Editorial Standards',
    bodyText: 'Placeholder — import the real PDF via Settings > Import Documents to replace this text.',
  );
  await addDoc(
    title: 'Segmentation Map Guide',
    category: 'Segmentation',
    fileType: 'pdf',
    pageCount: 2,
    description: 'Segmentation map guide, with the live tables below kept in sync separately.',
    bodyText: 'See the Segmentation Map tables (accessible from the Work Manual toolbar) for the '
        'searchable, sortable version of this content.',
  );
  await addDoc(
    title: 'Editing & Editorial — User Guide',
    category: 'Editing & Post',
    fileType: 'pdf',
    pageCount: 161,
    description: 'Full department user guide.',
    bodyText: 'Placeholder — import the real PDF via Settings > Import Documents to replace this text.',
  );
  await addDoc(
    title: 'QC 2 & Missing List — Duty Walkthrough',
    category: 'Walkthroughs',
    fileType: 'video',
    durationSeconds: 760,
    description: 'Explains the complete QC 2 and missing-list process.',
    bodyText: 'Placeholder — import the real video via Settings > Import Documents to replace this text.',
  );
  await addDoc(
    title: 'ERM Requests',
    category: 'Workflow',
    fileType: 'procedure',
    description: 'Procedure card.',
    bodyText: 'Add the ERM request procedure text here.',
  );
  await addDoc(
    title: 'Export to DALET',
    category: 'Workflow',
    fileType: 'procedure',
    description: 'Procedure card.',
    bodyText: 'Add the DALET export procedure text here.',
  );
  await addDoc(
    title: 'Check, Copy, Segment & QC 1',
    category: 'QC',
    fileType: 'procedure',
    description: 'Procedure card.',
    bodyText: 'Add the check/copy/segment/QC1 procedure text here.',
  );
  await addDoc(
    title: 'Special TV Programs',
    category: 'Compliance',
    fileType: 'procedure',
    description: 'Procedure card.',
    bodyText: 'Add the special TV programs compliance procedure text here.',
  );
  await addDoc(
    title: 'Not Suitable for Repeat',
    category: 'Scheduling',
    fileType: 'procedure',
    description: 'Procedure card.',
    bodyText: 'Add the "not suitable for repeat" scheduling procedure text here.',
  );
  await addDoc(
    title: "What's ON",
    category: 'Workflow',
    fileType: 'procedure',
    description: 'Procedure card.',
    bodyText: "Add the What's ON procedure text here.",
  );

  await db.into(db.segContentCategoryRow).insert(SegContentCategoryRowCompanion.insert(
        contentCategory: 'News package (sample)',
        shahidSegmentation: Value('Not segmented'),
        mbcSegmentation: Value('Not segmented'),
        requiredNotes: const Value('Sample row — replace with the real segmentation policy.'),
        examples: const Value('e.g. daily bulletin'),
      ));
  await db.into(db.segContentCategoryRow).insert(SegContentCategoryRowCompanion.insert(
        contentCategory: 'Drama series (sample)',
        shahidSegmentation: Value('Segmented per episode'),
        mbcSegmentation: Value('Segmented per ad break'),
        requiredNotes: const Value('Sample row — replace with the real segmentation policy.'),
        examples: const Value('e.g. season premiere'),
      ));

  await db.into(db.segSpecialFileGroupRow).insert(SegSpecialFileGroupRowCompanion.insert(
        fileGroup: 'Promo (sample)',
        usage: const Value('On-air promotion'),
        channel: const Value('MBC 1'),
        requiredTreatment: const Value('No segmentation'),
        notes: const Value('Sample row — replace with the real policy.'),
      ));
  await db.into(db.segSpecialFileGroupRow).insert(SegSpecialFileGroupRowCompanion.insert(
        fileGroup: 'Sponsor billboard (sample)',
        usage: const Value('Sponsorship ident'),
        channel: const Value('MBC Drama'),
        requiredTreatment: const Value('Insert before/after break'),
        notes: const Value('Sample row — replace with the real policy.'),
      ));

  await db.into(db.segGlossaryRow).insert(SegGlossaryRowCompanion.insert(
        term: 'QC 2 (sample)',
        meaning: const Value('Second quality-control pass focused on missing-list checks.'),
        example: const Value('—'),
        relatedProcedure: const Value('QC 2 & Missing List — Duty Walkthrough'),
      ));
  await db.into(db.segGlossaryRow).insert(SegGlossaryRowCompanion.insert(
        term: 'Missing List (sample)',
        meaning: const Value('List of segments/files flagged as absent or incomplete.'),
        example: const Value('—'),
        relatedProcedure: const Value('QC 2 & Missing List — Duty Walkthrough'),
      ));

  await db.into(db.appSetting).insert(
        AppSettingCompanion.insert(key: 'seeded', value: const Value('true')),
      );
}
