import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/manual_repository.dart';

const _categoryIcons = {
  'Editorial Guidelines': Icons.edit_note,
  'Segmentation': Icons.table_chart_outlined,
  'Editing & Post': Icons.movie_creation_outlined,
  'Walkthroughs': Icons.play_circle_outline,
  'Workflow': Icons.sync_alt,
  'QC': Icons.fact_check_outlined,
  'Compliance': Icons.gavel_outlined,
  'Scheduling': Icons.event_note_outlined,
};

const _fileTypeIcons = {
  'pdf': Icons.picture_as_pdf_outlined,
  'video': Icons.videocam_outlined,
  'procedure': Icons.description_outlined,
};

class ManualScreen extends StatefulWidget {
  const ManualScreen({super.key});

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
  int? _categoryId;
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final repo = context.read<ManualRepository>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Manual'),
        actions: [
          IconButton(
            icon: const Icon(Icons.table_chart_outlined),
            tooltip: 'Segmentation Map',
            onPressed: () => context.go('/manual/segmentation'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, size: 20),
                hintText: 'Search title, category, reference, version, description, body text',
                isDense: true,
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          StreamBuilder<List<ManualCategoryData>>(
            stream: repo.watchCategories(),
            builder: (context, snapshot) {
              final categories = snapshot.data ?? [];
              return SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: const Text('All'),
                        selected: _categoryId == null,
                        onSelected: (_) => setState(() => _categoryId = null),
                      ),
                    ),
                    for (final c in categories)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          avatar: Icon(_categoryIcons[c.name] ?? Icons.folder_outlined, size: 16),
                          label: Text(c.name),
                          selected: _categoryId == c.id,
                          onSelected: (_) => setState(() => _categoryId = c.id),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: StreamBuilder<List<ManualDocumentData>>(
              stream: repo.watchDocuments(categoryId: _categoryId, searchQuery: _search),
              builder: (context, snapshot) {
                final docs = snapshot.data ?? [];
                if (docs.isEmpty) {
                  return const Center(
                    child: Text('No documents found.\nTry another keyword or category.',
                        textAlign: TextAlign.center, style: TextStyle(color: AppColors.mutedText)),
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 340,
                    mainAxisExtent: 150,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: docs.length,
                  itemBuilder: (context, i) => _DocCard(doc: docs[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DocCard extends StatelessWidget {
  const _DocCard({required this.doc});
  final ManualDocumentData doc;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.go('/manual/document/${doc.id}'),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(_fileTypeIcons[doc.fileType] ?? Icons.description_outlined,
                      size: 18, color: AppColors.primaryBlue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(doc.title,
                        maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              if (doc.reference != null || doc.version != null)
                Text('${doc.reference ?? ''} ${doc.version ?? ''}'.trim(),
                    style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
              const SizedBox(height: 6),
              Expanded(
                child: Text(
                  doc.description ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              Text(
                doc.fileType == 'video'
                    ? 'VIDEO${doc.durationSeconds != null ? ' · ${(doc.durationSeconds! / 60).round()} min' : ''}'
                    : doc.fileType == 'pdf'
                        ? 'PDF${doc.pageCount != null ? ' · ${doc.pageCount} pages' : ''}'
                        : 'PROCEDURE',
                style: const TextStyle(color: AppColors.mutedText, fontSize: 11, letterSpacing: 0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
