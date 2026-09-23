// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $StaffTable extends Staff with TableInfo<$StaffTable, StaffData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _initialsMeta = const VerificationMeta(
    'initials',
  );
  @override
  late final GeneratedColumn<String> initials = GeneratedColumn<String>(
    'initials',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 4,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jobTitleMeta = const VerificationMeta(
    'jobTitle',
  );
  @override
  late final GeneratedColumn<String> jobTitle = GeneratedColumn<String>(
    'job_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _homeSectionMeta = const VerificationMeta(
    'homeSection',
  );
  @override
  late final GeneratedColumn<String> homeSection = GeneratedColumn<String>(
    'home_section',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Unassigned'),
  );
  static const VerificationMeta _defaultShiftCodeMeta = const VerificationMeta(
    'defaultShiftCode',
  );
  @override
  late final GeneratedColumn<String> defaultShiftCode = GeneratedColumn<String>(
    'default_shift_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _suiteOrBayMeta = const VerificationMeta(
    'suiteOrBay',
  );
  @override
  late final GeneratedColumn<String> suiteOrBay = GeneratedColumn<String>(
    'suite_or_bay',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extensionMeta = const VerificationMeta(
    'extension',
  );
  @override
  late final GeneratedColumn<String> extension = GeneratedColumn<String>(
    'extension',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skillsMeta = const VerificationMeta('skills');
  @override
  late final GeneratedColumn<String> skills = GeneratedColumn<String>(
    'skills',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languagesMeta = const VerificationMeta(
    'languages',
  );
  @override
  late final GeneratedColumn<String> languages = GeneratedColumn<String>(
    'languages',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _inChargeEligibleMeta = const VerificationMeta(
    'inChargeEligible',
  );
  @override
  late final GeneratedColumn<bool> inChargeEligible = GeneratedColumn<bool>(
    'in_charge_eligible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("in_charge_eligible" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _qc2EligibleMeta = const VerificationMeta(
    'qc2Eligible',
  );
  @override
  late final GeneratedColumn<bool> qc2Eligible = GeneratedColumn<bool>(
    'qc2_eligible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("qc2_eligible" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    initials,
    jobTitle,
    homeSection,
    defaultShiftCode,
    suiteOrBay,
    extension,
    email,
    skills,
    languages,
    inChargeEligible,
    qc2Eligible,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'staff';
  @override
  VerificationContext validateIntegrity(
    Insertable<StaffData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('initials')) {
      context.handle(
        _initialsMeta,
        initials.isAcceptableOrUnknown(data['initials']!, _initialsMeta),
      );
    } else if (isInserting) {
      context.missing(_initialsMeta);
    }
    if (data.containsKey('job_title')) {
      context.handle(
        _jobTitleMeta,
        jobTitle.isAcceptableOrUnknown(data['job_title']!, _jobTitleMeta),
      );
    }
    if (data.containsKey('home_section')) {
      context.handle(
        _homeSectionMeta,
        homeSection.isAcceptableOrUnknown(
          data['home_section']!,
          _homeSectionMeta,
        ),
      );
    }
    if (data.containsKey('default_shift_code')) {
      context.handle(
        _defaultShiftCodeMeta,
        defaultShiftCode.isAcceptableOrUnknown(
          data['default_shift_code']!,
          _defaultShiftCodeMeta,
        ),
      );
    }
    if (data.containsKey('suite_or_bay')) {
      context.handle(
        _suiteOrBayMeta,
        suiteOrBay.isAcceptableOrUnknown(
          data['suite_or_bay']!,
          _suiteOrBayMeta,
        ),
      );
    }
    if (data.containsKey('extension')) {
      context.handle(
        _extensionMeta,
        extension.isAcceptableOrUnknown(data['extension']!, _extensionMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('skills')) {
      context.handle(
        _skillsMeta,
        skills.isAcceptableOrUnknown(data['skills']!, _skillsMeta),
      );
    }
    if (data.containsKey('languages')) {
      context.handle(
        _languagesMeta,
        languages.isAcceptableOrUnknown(data['languages']!, _languagesMeta),
      );
    }
    if (data.containsKey('in_charge_eligible')) {
      context.handle(
        _inChargeEligibleMeta,
        inChargeEligible.isAcceptableOrUnknown(
          data['in_charge_eligible']!,
          _inChargeEligibleMeta,
        ),
      );
    }
    if (data.containsKey('qc2_eligible')) {
      context.handle(
        _qc2EligibleMeta,
        qc2Eligible.isAcceptableOrUnknown(
          data['qc2_eligible']!,
          _qc2EligibleMeta,
        ),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StaffData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      initials: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}initials'],
      )!,
      jobTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}job_title'],
      ),
      homeSection: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_section'],
      )!,
      defaultShiftCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_shift_code'],
      ),
      suiteOrBay: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}suite_or_bay'],
      ),
      extension: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extension'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      skills: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}skills'],
      ),
      languages: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}languages'],
      ),
      inChargeEligible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}in_charge_eligible'],
      )!,
      qc2Eligible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}qc2_eligible'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $StaffTable createAlias(String alias) {
    return $StaffTable(attachedDatabase, alias);
  }
}

class StaffData extends DataClass implements Insertable<StaffData> {
  final int id;
  final String fullName;
  final String initials;
  final String? jobTitle;
  final String homeSection;
  final String? defaultShiftCode;
  final String? suiteOrBay;
  final String? extension;
  final String? email;
  final String? skills;
  final String? languages;
  final bool inChargeEligible;
  final bool qc2Eligible;
  final bool active;
  const StaffData({
    required this.id,
    required this.fullName,
    required this.initials,
    this.jobTitle,
    required this.homeSection,
    this.defaultShiftCode,
    this.suiteOrBay,
    this.extension,
    this.email,
    this.skills,
    this.languages,
    required this.inChargeEligible,
    required this.qc2Eligible,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['initials'] = Variable<String>(initials);
    if (!nullToAbsent || jobTitle != null) {
      map['job_title'] = Variable<String>(jobTitle);
    }
    map['home_section'] = Variable<String>(homeSection);
    if (!nullToAbsent || defaultShiftCode != null) {
      map['default_shift_code'] = Variable<String>(defaultShiftCode);
    }
    if (!nullToAbsent || suiteOrBay != null) {
      map['suite_or_bay'] = Variable<String>(suiteOrBay);
    }
    if (!nullToAbsent || extension != null) {
      map['extension'] = Variable<String>(extension);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || skills != null) {
      map['skills'] = Variable<String>(skills);
    }
    if (!nullToAbsent || languages != null) {
      map['languages'] = Variable<String>(languages);
    }
    map['in_charge_eligible'] = Variable<bool>(inChargeEligible);
    map['qc2_eligible'] = Variable<bool>(qc2Eligible);
    map['active'] = Variable<bool>(active);
    return map;
  }

  StaffCompanion toCompanion(bool nullToAbsent) {
    return StaffCompanion(
      id: Value(id),
      fullName: Value(fullName),
      initials: Value(initials),
      jobTitle: jobTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(jobTitle),
      homeSection: Value(homeSection),
      defaultShiftCode: defaultShiftCode == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultShiftCode),
      suiteOrBay: suiteOrBay == null && nullToAbsent
          ? const Value.absent()
          : Value(suiteOrBay),
      extension: extension == null && nullToAbsent
          ? const Value.absent()
          : Value(extension),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      skills: skills == null && nullToAbsent
          ? const Value.absent()
          : Value(skills),
      languages: languages == null && nullToAbsent
          ? const Value.absent()
          : Value(languages),
      inChargeEligible: Value(inChargeEligible),
      qc2Eligible: Value(qc2Eligible),
      active: Value(active),
    );
  }

  factory StaffData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffData(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      initials: serializer.fromJson<String>(json['initials']),
      jobTitle: serializer.fromJson<String?>(json['jobTitle']),
      homeSection: serializer.fromJson<String>(json['homeSection']),
      defaultShiftCode: serializer.fromJson<String?>(json['defaultShiftCode']),
      suiteOrBay: serializer.fromJson<String?>(json['suiteOrBay']),
      extension: serializer.fromJson<String?>(json['extension']),
      email: serializer.fromJson<String?>(json['email']),
      skills: serializer.fromJson<String?>(json['skills']),
      languages: serializer.fromJson<String?>(json['languages']),
      inChargeEligible: serializer.fromJson<bool>(json['inChargeEligible']),
      qc2Eligible: serializer.fromJson<bool>(json['qc2Eligible']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'initials': serializer.toJson<String>(initials),
      'jobTitle': serializer.toJson<String?>(jobTitle),
      'homeSection': serializer.toJson<String>(homeSection),
      'defaultShiftCode': serializer.toJson<String?>(defaultShiftCode),
      'suiteOrBay': serializer.toJson<String?>(suiteOrBay),
      'extension': serializer.toJson<String?>(extension),
      'email': serializer.toJson<String?>(email),
      'skills': serializer.toJson<String?>(skills),
      'languages': serializer.toJson<String?>(languages),
      'inChargeEligible': serializer.toJson<bool>(inChargeEligible),
      'qc2Eligible': serializer.toJson<bool>(qc2Eligible),
      'active': serializer.toJson<bool>(active),
    };
  }

  StaffData copyWith({
    int? id,
    String? fullName,
    String? initials,
    Value<String?> jobTitle = const Value.absent(),
    String? homeSection,
    Value<String?> defaultShiftCode = const Value.absent(),
    Value<String?> suiteOrBay = const Value.absent(),
    Value<String?> extension = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> skills = const Value.absent(),
    Value<String?> languages = const Value.absent(),
    bool? inChargeEligible,
    bool? qc2Eligible,
    bool? active,
  }) => StaffData(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    initials: initials ?? this.initials,
    jobTitle: jobTitle.present ? jobTitle.value : this.jobTitle,
    homeSection: homeSection ?? this.homeSection,
    defaultShiftCode: defaultShiftCode.present
        ? defaultShiftCode.value
        : this.defaultShiftCode,
    suiteOrBay: suiteOrBay.present ? suiteOrBay.value : this.suiteOrBay,
    extension: extension.present ? extension.value : this.extension,
    email: email.present ? email.value : this.email,
    skills: skills.present ? skills.value : this.skills,
    languages: languages.present ? languages.value : this.languages,
    inChargeEligible: inChargeEligible ?? this.inChargeEligible,
    qc2Eligible: qc2Eligible ?? this.qc2Eligible,
    active: active ?? this.active,
  );
  StaffData copyWithCompanion(StaffCompanion data) {
    return StaffData(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      initials: data.initials.present ? data.initials.value : this.initials,
      jobTitle: data.jobTitle.present ? data.jobTitle.value : this.jobTitle,
      homeSection: data.homeSection.present
          ? data.homeSection.value
          : this.homeSection,
      defaultShiftCode: data.defaultShiftCode.present
          ? data.defaultShiftCode.value
          : this.defaultShiftCode,
      suiteOrBay: data.suiteOrBay.present
          ? data.suiteOrBay.value
          : this.suiteOrBay,
      extension: data.extension.present ? data.extension.value : this.extension,
      email: data.email.present ? data.email.value : this.email,
      skills: data.skills.present ? data.skills.value : this.skills,
      languages: data.languages.present ? data.languages.value : this.languages,
      inChargeEligible: data.inChargeEligible.present
          ? data.inChargeEligible.value
          : this.inChargeEligible,
      qc2Eligible: data.qc2Eligible.present
          ? data.qc2Eligible.value
          : this.qc2Eligible,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StaffData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('initials: $initials, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('homeSection: $homeSection, ')
          ..write('defaultShiftCode: $defaultShiftCode, ')
          ..write('suiteOrBay: $suiteOrBay, ')
          ..write('extension: $extension, ')
          ..write('email: $email, ')
          ..write('skills: $skills, ')
          ..write('languages: $languages, ')
          ..write('inChargeEligible: $inChargeEligible, ')
          ..write('qc2Eligible: $qc2Eligible, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    initials,
    jobTitle,
    homeSection,
    defaultShiftCode,
    suiteOrBay,
    extension,
    email,
    skills,
    languages,
    inChargeEligible,
    qc2Eligible,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.initials == this.initials &&
          other.jobTitle == this.jobTitle &&
          other.homeSection == this.homeSection &&
          other.defaultShiftCode == this.defaultShiftCode &&
          other.suiteOrBay == this.suiteOrBay &&
          other.extension == this.extension &&
          other.email == this.email &&
          other.skills == this.skills &&
          other.languages == this.languages &&
          other.inChargeEligible == this.inChargeEligible &&
          other.qc2Eligible == this.qc2Eligible &&
          other.active == this.active);
}

class StaffCompanion extends UpdateCompanion<StaffData> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> initials;
  final Value<String?> jobTitle;
  final Value<String> homeSection;
  final Value<String?> defaultShiftCode;
  final Value<String?> suiteOrBay;
  final Value<String?> extension;
  final Value<String?> email;
  final Value<String?> skills;
  final Value<String?> languages;
  final Value<bool> inChargeEligible;
  final Value<bool> qc2Eligible;
  final Value<bool> active;
  const StaffCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.initials = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.homeSection = const Value.absent(),
    this.defaultShiftCode = const Value.absent(),
    this.suiteOrBay = const Value.absent(),
    this.extension = const Value.absent(),
    this.email = const Value.absent(),
    this.skills = const Value.absent(),
    this.languages = const Value.absent(),
    this.inChargeEligible = const Value.absent(),
    this.qc2Eligible = const Value.absent(),
    this.active = const Value.absent(),
  });
  StaffCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String initials,
    this.jobTitle = const Value.absent(),
    this.homeSection = const Value.absent(),
    this.defaultShiftCode = const Value.absent(),
    this.suiteOrBay = const Value.absent(),
    this.extension = const Value.absent(),
    this.email = const Value.absent(),
    this.skills = const Value.absent(),
    this.languages = const Value.absent(),
    this.inChargeEligible = const Value.absent(),
    this.qc2Eligible = const Value.absent(),
    this.active = const Value.absent(),
  }) : fullName = Value(fullName),
       initials = Value(initials);
  static Insertable<StaffData> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? initials,
    Expression<String>? jobTitle,
    Expression<String>? homeSection,
    Expression<String>? defaultShiftCode,
    Expression<String>? suiteOrBay,
    Expression<String>? extension,
    Expression<String>? email,
    Expression<String>? skills,
    Expression<String>? languages,
    Expression<bool>? inChargeEligible,
    Expression<bool>? qc2Eligible,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (initials != null) 'initials': initials,
      if (jobTitle != null) 'job_title': jobTitle,
      if (homeSection != null) 'home_section': homeSection,
      if (defaultShiftCode != null) 'default_shift_code': defaultShiftCode,
      if (suiteOrBay != null) 'suite_or_bay': suiteOrBay,
      if (extension != null) 'extension': extension,
      if (email != null) 'email': email,
      if (skills != null) 'skills': skills,
      if (languages != null) 'languages': languages,
      if (inChargeEligible != null) 'in_charge_eligible': inChargeEligible,
      if (qc2Eligible != null) 'qc2_eligible': qc2Eligible,
      if (active != null) 'active': active,
    });
  }

  StaffCompanion copyWith({
    Value<int>? id,
    Value<String>? fullName,
    Value<String>? initials,
    Value<String?>? jobTitle,
    Value<String>? homeSection,
    Value<String?>? defaultShiftCode,
    Value<String?>? suiteOrBay,
    Value<String?>? extension,
    Value<String?>? email,
    Value<String?>? skills,
    Value<String?>? languages,
    Value<bool>? inChargeEligible,
    Value<bool>? qc2Eligible,
    Value<bool>? active,
  }) {
    return StaffCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      initials: initials ?? this.initials,
      jobTitle: jobTitle ?? this.jobTitle,
      homeSection: homeSection ?? this.homeSection,
      defaultShiftCode: defaultShiftCode ?? this.defaultShiftCode,
      suiteOrBay: suiteOrBay ?? this.suiteOrBay,
      extension: extension ?? this.extension,
      email: email ?? this.email,
      skills: skills ?? this.skills,
      languages: languages ?? this.languages,
      inChargeEligible: inChargeEligible ?? this.inChargeEligible,
      qc2Eligible: qc2Eligible ?? this.qc2Eligible,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (initials.present) {
      map['initials'] = Variable<String>(initials.value);
    }
    if (jobTitle.present) {
      map['job_title'] = Variable<String>(jobTitle.value);
    }
    if (homeSection.present) {
      map['home_section'] = Variable<String>(homeSection.value);
    }
    if (defaultShiftCode.present) {
      map['default_shift_code'] = Variable<String>(defaultShiftCode.value);
    }
    if (suiteOrBay.present) {
      map['suite_or_bay'] = Variable<String>(suiteOrBay.value);
    }
    if (extension.present) {
      map['extension'] = Variable<String>(extension.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (skills.present) {
      map['skills'] = Variable<String>(skills.value);
    }
    if (languages.present) {
      map['languages'] = Variable<String>(languages.value);
    }
    if (inChargeEligible.present) {
      map['in_charge_eligible'] = Variable<bool>(inChargeEligible.value);
    }
    if (qc2Eligible.present) {
      map['qc2_eligible'] = Variable<bool>(qc2Eligible.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StaffCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('initials: $initials, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('homeSection: $homeSection, ')
          ..write('defaultShiftCode: $defaultShiftCode, ')
          ..write('suiteOrBay: $suiteOrBay, ')
          ..write('extension: $extension, ')
          ..write('email: $email, ')
          ..write('skills: $skills, ')
          ..write('languages: $languages, ')
          ..write('inChargeEligible: $inChargeEligible, ')
          ..write('qc2Eligible: $qc2Eligible, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $ImportRecordTable extends ImportRecord
    with TableInfo<$ImportRecordTable, ImportRecordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImportRecordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _importedByMeta = const VerificationMeta(
    'importedBy',
  );
  @override
  late final GeneratedColumn<String> importedBy = GeneratedColumn<String>(
    'imported_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _importedAtMeta = const VerificationMeta(
    'importedAt',
  );
  @override
  late final GeneratedColumn<DateTime> importedAt = GeneratedColumn<DateTime>(
    'imported_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordsProcessedMeta = const VerificationMeta(
    'recordsProcessed',
  );
  @override
  late final GeneratedColumn<int> recordsProcessed = GeneratedColumn<int>(
    'records_processed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _warningsJsonMeta = const VerificationMeta(
    'warningsJson',
  );
  @override
  late final GeneratedColumn<String> warningsJson = GeneratedColumn<String>(
    'warnings_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rollbackAvailableMeta = const VerificationMeta(
    'rollbackAvailable',
  );
  @override
  late final GeneratedColumn<bool> rollbackAvailable = GeneratedColumn<bool>(
    'rollback_available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("rollback_available" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fileName,
    importedBy,
    importedAt,
    recordsProcessed,
    warningsJson,
    version,
    rollbackAvailable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'import_record';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImportRecordData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('imported_by')) {
      context.handle(
        _importedByMeta,
        importedBy.isAcceptableOrUnknown(data['imported_by']!, _importedByMeta),
      );
    }
    if (data.containsKey('imported_at')) {
      context.handle(
        _importedAtMeta,
        importedAt.isAcceptableOrUnknown(data['imported_at']!, _importedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_importedAtMeta);
    }
    if (data.containsKey('records_processed')) {
      context.handle(
        _recordsProcessedMeta,
        recordsProcessed.isAcceptableOrUnknown(
          data['records_processed']!,
          _recordsProcessedMeta,
        ),
      );
    }
    if (data.containsKey('warnings_json')) {
      context.handle(
        _warningsJsonMeta,
        warningsJson.isAcceptableOrUnknown(
          data['warnings_json']!,
          _warningsJsonMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('rollback_available')) {
      context.handle(
        _rollbackAvailableMeta,
        rollbackAvailable.isAcceptableOrUnknown(
          data['rollback_available']!,
          _rollbackAvailableMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImportRecordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImportRecordData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      importedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imported_by'],
      ),
      importedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}imported_at'],
      )!,
      recordsProcessed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}records_processed'],
      )!,
      warningsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warnings_json'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      rollbackAvailable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}rollback_available'],
      )!,
    );
  }

  @override
  $ImportRecordTable createAlias(String alias) {
    return $ImportRecordTable(attachedDatabase, alias);
  }
}

class ImportRecordData extends DataClass
    implements Insertable<ImportRecordData> {
  final int id;
  final String fileName;
  final String? importedBy;
  final DateTime importedAt;
  final int recordsProcessed;
  final String? warningsJson;
  final int version;
  final bool rollbackAvailable;
  const ImportRecordData({
    required this.id,
    required this.fileName,
    this.importedBy,
    required this.importedAt,
    required this.recordsProcessed,
    this.warningsJson,
    required this.version,
    required this.rollbackAvailable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['file_name'] = Variable<String>(fileName);
    if (!nullToAbsent || importedBy != null) {
      map['imported_by'] = Variable<String>(importedBy);
    }
    map['imported_at'] = Variable<DateTime>(importedAt);
    map['records_processed'] = Variable<int>(recordsProcessed);
    if (!nullToAbsent || warningsJson != null) {
      map['warnings_json'] = Variable<String>(warningsJson);
    }
    map['version'] = Variable<int>(version);
    map['rollback_available'] = Variable<bool>(rollbackAvailable);
    return map;
  }

  ImportRecordCompanion toCompanion(bool nullToAbsent) {
    return ImportRecordCompanion(
      id: Value(id),
      fileName: Value(fileName),
      importedBy: importedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(importedBy),
      importedAt: Value(importedAt),
      recordsProcessed: Value(recordsProcessed),
      warningsJson: warningsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(warningsJson),
      version: Value(version),
      rollbackAvailable: Value(rollbackAvailable),
    );
  }

  factory ImportRecordData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImportRecordData(
      id: serializer.fromJson<int>(json['id']),
      fileName: serializer.fromJson<String>(json['fileName']),
      importedBy: serializer.fromJson<String?>(json['importedBy']),
      importedAt: serializer.fromJson<DateTime>(json['importedAt']),
      recordsProcessed: serializer.fromJson<int>(json['recordsProcessed']),
      warningsJson: serializer.fromJson<String?>(json['warningsJson']),
      version: serializer.fromJson<int>(json['version']),
      rollbackAvailable: serializer.fromJson<bool>(json['rollbackAvailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fileName': serializer.toJson<String>(fileName),
      'importedBy': serializer.toJson<String?>(importedBy),
      'importedAt': serializer.toJson<DateTime>(importedAt),
      'recordsProcessed': serializer.toJson<int>(recordsProcessed),
      'warningsJson': serializer.toJson<String?>(warningsJson),
      'version': serializer.toJson<int>(version),
      'rollbackAvailable': serializer.toJson<bool>(rollbackAvailable),
    };
  }

  ImportRecordData copyWith({
    int? id,
    String? fileName,
    Value<String?> importedBy = const Value.absent(),
    DateTime? importedAt,
    int? recordsProcessed,
    Value<String?> warningsJson = const Value.absent(),
    int? version,
    bool? rollbackAvailable,
  }) => ImportRecordData(
    id: id ?? this.id,
    fileName: fileName ?? this.fileName,
    importedBy: importedBy.present ? importedBy.value : this.importedBy,
    importedAt: importedAt ?? this.importedAt,
    recordsProcessed: recordsProcessed ?? this.recordsProcessed,
    warningsJson: warningsJson.present ? warningsJson.value : this.warningsJson,
    version: version ?? this.version,
    rollbackAvailable: rollbackAvailable ?? this.rollbackAvailable,
  );
  ImportRecordData copyWithCompanion(ImportRecordCompanion data) {
    return ImportRecordData(
      id: data.id.present ? data.id.value : this.id,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      importedBy: data.importedBy.present
          ? data.importedBy.value
          : this.importedBy,
      importedAt: data.importedAt.present
          ? data.importedAt.value
          : this.importedAt,
      recordsProcessed: data.recordsProcessed.present
          ? data.recordsProcessed.value
          : this.recordsProcessed,
      warningsJson: data.warningsJson.present
          ? data.warningsJson.value
          : this.warningsJson,
      version: data.version.present ? data.version.value : this.version,
      rollbackAvailable: data.rollbackAvailable.present
          ? data.rollbackAvailable.value
          : this.rollbackAvailable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImportRecordData(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('importedBy: $importedBy, ')
          ..write('importedAt: $importedAt, ')
          ..write('recordsProcessed: $recordsProcessed, ')
          ..write('warningsJson: $warningsJson, ')
          ..write('version: $version, ')
          ..write('rollbackAvailable: $rollbackAvailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fileName,
    importedBy,
    importedAt,
    recordsProcessed,
    warningsJson,
    version,
    rollbackAvailable,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImportRecordData &&
          other.id == this.id &&
          other.fileName == this.fileName &&
          other.importedBy == this.importedBy &&
          other.importedAt == this.importedAt &&
          other.recordsProcessed == this.recordsProcessed &&
          other.warningsJson == this.warningsJson &&
          other.version == this.version &&
          other.rollbackAvailable == this.rollbackAvailable);
}

class ImportRecordCompanion extends UpdateCompanion<ImportRecordData> {
  final Value<int> id;
  final Value<String> fileName;
  final Value<String?> importedBy;
  final Value<DateTime> importedAt;
  final Value<int> recordsProcessed;
  final Value<String?> warningsJson;
  final Value<int> version;
  final Value<bool> rollbackAvailable;
  const ImportRecordCompanion({
    this.id = const Value.absent(),
    this.fileName = const Value.absent(),
    this.importedBy = const Value.absent(),
    this.importedAt = const Value.absent(),
    this.recordsProcessed = const Value.absent(),
    this.warningsJson = const Value.absent(),
    this.version = const Value.absent(),
    this.rollbackAvailable = const Value.absent(),
  });
  ImportRecordCompanion.insert({
    this.id = const Value.absent(),
    required String fileName,
    this.importedBy = const Value.absent(),
    required DateTime importedAt,
    this.recordsProcessed = const Value.absent(),
    this.warningsJson = const Value.absent(),
    required int version,
    this.rollbackAvailable = const Value.absent(),
  }) : fileName = Value(fileName),
       importedAt = Value(importedAt),
       version = Value(version);
  static Insertable<ImportRecordData> custom({
    Expression<int>? id,
    Expression<String>? fileName,
    Expression<String>? importedBy,
    Expression<DateTime>? importedAt,
    Expression<int>? recordsProcessed,
    Expression<String>? warningsJson,
    Expression<int>? version,
    Expression<bool>? rollbackAvailable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileName != null) 'file_name': fileName,
      if (importedBy != null) 'imported_by': importedBy,
      if (importedAt != null) 'imported_at': importedAt,
      if (recordsProcessed != null) 'records_processed': recordsProcessed,
      if (warningsJson != null) 'warnings_json': warningsJson,
      if (version != null) 'version': version,
      if (rollbackAvailable != null) 'rollback_available': rollbackAvailable,
    });
  }

  ImportRecordCompanion copyWith({
    Value<int>? id,
    Value<String>? fileName,
    Value<String?>? importedBy,
    Value<DateTime>? importedAt,
    Value<int>? recordsProcessed,
    Value<String?>? warningsJson,
    Value<int>? version,
    Value<bool>? rollbackAvailable,
  }) {
    return ImportRecordCompanion(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      importedBy: importedBy ?? this.importedBy,
      importedAt: importedAt ?? this.importedAt,
      recordsProcessed: recordsProcessed ?? this.recordsProcessed,
      warningsJson: warningsJson ?? this.warningsJson,
      version: version ?? this.version,
      rollbackAvailable: rollbackAvailable ?? this.rollbackAvailable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (importedBy.present) {
      map['imported_by'] = Variable<String>(importedBy.value);
    }
    if (importedAt.present) {
      map['imported_at'] = Variable<DateTime>(importedAt.value);
    }
    if (recordsProcessed.present) {
      map['records_processed'] = Variable<int>(recordsProcessed.value);
    }
    if (warningsJson.present) {
      map['warnings_json'] = Variable<String>(warningsJson.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rollbackAvailable.present) {
      map['rollback_available'] = Variable<bool>(rollbackAvailable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImportRecordCompanion(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('importedBy: $importedBy, ')
          ..write('importedAt: $importedAt, ')
          ..write('recordsProcessed: $recordsProcessed, ')
          ..write('warningsJson: $warningsJson, ')
          ..write('version: $version, ')
          ..write('rollbackAvailable: $rollbackAvailable')
          ..write(')'))
        .toString();
  }
}

class $RotaAssignmentTable extends RotaAssignment
    with TableInfo<$RotaAssignmentTable, RotaAssignmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RotaAssignmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _staffIdMeta = const VerificationMeta(
    'staffId',
  );
  @override
  late final GeneratedColumn<int> staffId = GeneratedColumn<int>(
    'staff_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES staff (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sectionMeta = const VerificationMeta(
    'section',
  );
  @override
  late final GeneratedColumn<String> section = GeneratedColumn<String>(
    'section',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hoursStartMeta = const VerificationMeta(
    'hoursStart',
  );
  @override
  late final GeneratedColumn<String> hoursStart = GeneratedColumn<String>(
    'hours_start',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hoursEndMeta = const VerificationMeta(
    'hoursEnd',
  );
  @override
  late final GeneratedColumn<String> hoursEnd = GeneratedColumn<String>(
    'hours_end',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qc2DutyMeta = const VerificationMeta(
    'qc2Duty',
  );
  @override
  late final GeneratedColumn<bool> qc2Duty = GeneratedColumn<bool>(
    'qc2_duty',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("qc2_duty" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceImportIdMeta = const VerificationMeta(
    'sourceImportId',
  );
  @override
  late final GeneratedColumn<int> sourceImportId = GeneratedColumn<int>(
    'source_import_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES import_record (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    staffId,
    date,
    section,
    code,
    hoursStart,
    hoursEnd,
    qc2Duty,
    status,
    sourceImportId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rota_assignment';
  @override
  VerificationContext validateIntegrity(
    Insertable<RotaAssignmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('staff_id')) {
      context.handle(
        _staffIdMeta,
        staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta),
      );
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('section')) {
      context.handle(
        _sectionMeta,
        section.isAcceptableOrUnknown(data['section']!, _sectionMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('hours_start')) {
      context.handle(
        _hoursStartMeta,
        hoursStart.isAcceptableOrUnknown(data['hours_start']!, _hoursStartMeta),
      );
    }
    if (data.containsKey('hours_end')) {
      context.handle(
        _hoursEndMeta,
        hoursEnd.isAcceptableOrUnknown(data['hours_end']!, _hoursEndMeta),
      );
    }
    if (data.containsKey('qc2_duty')) {
      context.handle(
        _qc2DutyMeta,
        qc2Duty.isAcceptableOrUnknown(data['qc2_duty']!, _qc2DutyMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('source_import_id')) {
      context.handle(
        _sourceImportIdMeta,
        sourceImportId.isAcceptableOrUnknown(
          data['source_import_id']!,
          _sourceImportIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {staffId, date},
  ];
  @override
  RotaAssignmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RotaAssignmentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      staffId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}staff_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      section: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      hoursStart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hours_start'],
      ),
      hoursEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hours_end'],
      ),
      qc2Duty: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}qc2_duty'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      sourceImportId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_import_id'],
      ),
    );
  }

  @override
  $RotaAssignmentTable createAlias(String alias) {
    return $RotaAssignmentTable(attachedDatabase, alias);
  }
}

class RotaAssignmentData extends DataClass
    implements Insertable<RotaAssignmentData> {
  final int id;
  final int staffId;
  final DateTime date;
  final String section;
  final String code;
  final String? hoursStart;
  final String? hoursEnd;
  final bool qc2Duty;
  final String status;
  final int? sourceImportId;
  const RotaAssignmentData({
    required this.id,
    required this.staffId,
    required this.date,
    required this.section,
    required this.code,
    this.hoursStart,
    this.hoursEnd,
    required this.qc2Duty,
    required this.status,
    this.sourceImportId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['staff_id'] = Variable<int>(staffId);
    map['date'] = Variable<DateTime>(date);
    map['section'] = Variable<String>(section);
    map['code'] = Variable<String>(code);
    if (!nullToAbsent || hoursStart != null) {
      map['hours_start'] = Variable<String>(hoursStart);
    }
    if (!nullToAbsent || hoursEnd != null) {
      map['hours_end'] = Variable<String>(hoursEnd);
    }
    map['qc2_duty'] = Variable<bool>(qc2Duty);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || sourceImportId != null) {
      map['source_import_id'] = Variable<int>(sourceImportId);
    }
    return map;
  }

  RotaAssignmentCompanion toCompanion(bool nullToAbsent) {
    return RotaAssignmentCompanion(
      id: Value(id),
      staffId: Value(staffId),
      date: Value(date),
      section: Value(section),
      code: Value(code),
      hoursStart: hoursStart == null && nullToAbsent
          ? const Value.absent()
          : Value(hoursStart),
      hoursEnd: hoursEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(hoursEnd),
      qc2Duty: Value(qc2Duty),
      status: Value(status),
      sourceImportId: sourceImportId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceImportId),
    );
  }

  factory RotaAssignmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RotaAssignmentData(
      id: serializer.fromJson<int>(json['id']),
      staffId: serializer.fromJson<int>(json['staffId']),
      date: serializer.fromJson<DateTime>(json['date']),
      section: serializer.fromJson<String>(json['section']),
      code: serializer.fromJson<String>(json['code']),
      hoursStart: serializer.fromJson<String?>(json['hoursStart']),
      hoursEnd: serializer.fromJson<String?>(json['hoursEnd']),
      qc2Duty: serializer.fromJson<bool>(json['qc2Duty']),
      status: serializer.fromJson<String>(json['status']),
      sourceImportId: serializer.fromJson<int?>(json['sourceImportId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'staffId': serializer.toJson<int>(staffId),
      'date': serializer.toJson<DateTime>(date),
      'section': serializer.toJson<String>(section),
      'code': serializer.toJson<String>(code),
      'hoursStart': serializer.toJson<String?>(hoursStart),
      'hoursEnd': serializer.toJson<String?>(hoursEnd),
      'qc2Duty': serializer.toJson<bool>(qc2Duty),
      'status': serializer.toJson<String>(status),
      'sourceImportId': serializer.toJson<int?>(sourceImportId),
    };
  }

  RotaAssignmentData copyWith({
    int? id,
    int? staffId,
    DateTime? date,
    String? section,
    String? code,
    Value<String?> hoursStart = const Value.absent(),
    Value<String?> hoursEnd = const Value.absent(),
    bool? qc2Duty,
    String? status,
    Value<int?> sourceImportId = const Value.absent(),
  }) => RotaAssignmentData(
    id: id ?? this.id,
    staffId: staffId ?? this.staffId,
    date: date ?? this.date,
    section: section ?? this.section,
    code: code ?? this.code,
    hoursStart: hoursStart.present ? hoursStart.value : this.hoursStart,
    hoursEnd: hoursEnd.present ? hoursEnd.value : this.hoursEnd,
    qc2Duty: qc2Duty ?? this.qc2Duty,
    status: status ?? this.status,
    sourceImportId: sourceImportId.present
        ? sourceImportId.value
        : this.sourceImportId,
  );
  RotaAssignmentData copyWithCompanion(RotaAssignmentCompanion data) {
    return RotaAssignmentData(
      id: data.id.present ? data.id.value : this.id,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      date: data.date.present ? data.date.value : this.date,
      section: data.section.present ? data.section.value : this.section,
      code: data.code.present ? data.code.value : this.code,
      hoursStart: data.hoursStart.present
          ? data.hoursStart.value
          : this.hoursStart,
      hoursEnd: data.hoursEnd.present ? data.hoursEnd.value : this.hoursEnd,
      qc2Duty: data.qc2Duty.present ? data.qc2Duty.value : this.qc2Duty,
      status: data.status.present ? data.status.value : this.status,
      sourceImportId: data.sourceImportId.present
          ? data.sourceImportId.value
          : this.sourceImportId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RotaAssignmentData(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('date: $date, ')
          ..write('section: $section, ')
          ..write('code: $code, ')
          ..write('hoursStart: $hoursStart, ')
          ..write('hoursEnd: $hoursEnd, ')
          ..write('qc2Duty: $qc2Duty, ')
          ..write('status: $status, ')
          ..write('sourceImportId: $sourceImportId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    staffId,
    date,
    section,
    code,
    hoursStart,
    hoursEnd,
    qc2Duty,
    status,
    sourceImportId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RotaAssignmentData &&
          other.id == this.id &&
          other.staffId == this.staffId &&
          other.date == this.date &&
          other.section == this.section &&
          other.code == this.code &&
          other.hoursStart == this.hoursStart &&
          other.hoursEnd == this.hoursEnd &&
          other.qc2Duty == this.qc2Duty &&
          other.status == this.status &&
          other.sourceImportId == this.sourceImportId);
}

class RotaAssignmentCompanion extends UpdateCompanion<RotaAssignmentData> {
  final Value<int> id;
  final Value<int> staffId;
  final Value<DateTime> date;
  final Value<String> section;
  final Value<String> code;
  final Value<String?> hoursStart;
  final Value<String?> hoursEnd;
  final Value<bool> qc2Duty;
  final Value<String> status;
  final Value<int?> sourceImportId;
  const RotaAssignmentCompanion({
    this.id = const Value.absent(),
    this.staffId = const Value.absent(),
    this.date = const Value.absent(),
    this.section = const Value.absent(),
    this.code = const Value.absent(),
    this.hoursStart = const Value.absent(),
    this.hoursEnd = const Value.absent(),
    this.qc2Duty = const Value.absent(),
    this.status = const Value.absent(),
    this.sourceImportId = const Value.absent(),
  });
  RotaAssignmentCompanion.insert({
    this.id = const Value.absent(),
    required int staffId,
    required DateTime date,
    required String section,
    required String code,
    this.hoursStart = const Value.absent(),
    this.hoursEnd = const Value.absent(),
    this.qc2Duty = const Value.absent(),
    required String status,
    this.sourceImportId = const Value.absent(),
  }) : staffId = Value(staffId),
       date = Value(date),
       section = Value(section),
       code = Value(code),
       status = Value(status);
  static Insertable<RotaAssignmentData> custom({
    Expression<int>? id,
    Expression<int>? staffId,
    Expression<DateTime>? date,
    Expression<String>? section,
    Expression<String>? code,
    Expression<String>? hoursStart,
    Expression<String>? hoursEnd,
    Expression<bool>? qc2Duty,
    Expression<String>? status,
    Expression<int>? sourceImportId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (staffId != null) 'staff_id': staffId,
      if (date != null) 'date': date,
      if (section != null) 'section': section,
      if (code != null) 'code': code,
      if (hoursStart != null) 'hours_start': hoursStart,
      if (hoursEnd != null) 'hours_end': hoursEnd,
      if (qc2Duty != null) 'qc2_duty': qc2Duty,
      if (status != null) 'status': status,
      if (sourceImportId != null) 'source_import_id': sourceImportId,
    });
  }

  RotaAssignmentCompanion copyWith({
    Value<int>? id,
    Value<int>? staffId,
    Value<DateTime>? date,
    Value<String>? section,
    Value<String>? code,
    Value<String?>? hoursStart,
    Value<String?>? hoursEnd,
    Value<bool>? qc2Duty,
    Value<String>? status,
    Value<int?>? sourceImportId,
  }) {
    return RotaAssignmentCompanion(
      id: id ?? this.id,
      staffId: staffId ?? this.staffId,
      date: date ?? this.date,
      section: section ?? this.section,
      code: code ?? this.code,
      hoursStart: hoursStart ?? this.hoursStart,
      hoursEnd: hoursEnd ?? this.hoursEnd,
      qc2Duty: qc2Duty ?? this.qc2Duty,
      status: status ?? this.status,
      sourceImportId: sourceImportId ?? this.sourceImportId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<int>(staffId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (section.present) {
      map['section'] = Variable<String>(section.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (hoursStart.present) {
      map['hours_start'] = Variable<String>(hoursStart.value);
    }
    if (hoursEnd.present) {
      map['hours_end'] = Variable<String>(hoursEnd.value);
    }
    if (qc2Duty.present) {
      map['qc2_duty'] = Variable<bool>(qc2Duty.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (sourceImportId.present) {
      map['source_import_id'] = Variable<int>(sourceImportId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RotaAssignmentCompanion(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('date: $date, ')
          ..write('section: $section, ')
          ..write('code: $code, ')
          ..write('hoursStart: $hoursStart, ')
          ..write('hoursEnd: $hoursEnd, ')
          ..write('qc2Duty: $qc2Duty, ')
          ..write('status: $status, ')
          ..write('sourceImportId: $sourceImportId')
          ..write(')'))
        .toString();
  }
}

class $DutyAssignmentTable extends DutyAssignment
    with TableInfo<$DutyAssignmentTable, DutyAssignmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DutyAssignmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sectionMeta = const VerificationMeta(
    'section',
  );
  @override
  late final GeneratedColumn<String> section = GeneratedColumn<String>(
    'section',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inChargeStaffIdMeta = const VerificationMeta(
    'inChargeStaffId',
  );
  @override
  late final GeneratedColumn<int> inChargeStaffId = GeneratedColumn<int>(
    'in_charge_staff_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES staff (id)',
    ),
  );
  static const VerificationMeta _qc2StaffIdMeta = const VerificationMeta(
    'qc2StaffId',
  );
  @override
  late final GeneratedColumn<int> qc2StaffId = GeneratedColumn<int>(
    'qc2_staff_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES staff (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    section,
    inChargeStaffId,
    qc2StaffId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'duty_assignment';
  @override
  VerificationContext validateIntegrity(
    Insertable<DutyAssignmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('section')) {
      context.handle(
        _sectionMeta,
        section.isAcceptableOrUnknown(data['section']!, _sectionMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionMeta);
    }
    if (data.containsKey('in_charge_staff_id')) {
      context.handle(
        _inChargeStaffIdMeta,
        inChargeStaffId.isAcceptableOrUnknown(
          data['in_charge_staff_id']!,
          _inChargeStaffIdMeta,
        ),
      );
    }
    if (data.containsKey('qc2_staff_id')) {
      context.handle(
        _qc2StaffIdMeta,
        qc2StaffId.isAcceptableOrUnknown(
          data['qc2_staff_id']!,
          _qc2StaffIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {date, section},
  ];
  @override
  DutyAssignmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DutyAssignmentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      section: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section'],
      )!,
      inChargeStaffId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}in_charge_staff_id'],
      ),
      qc2StaffId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qc2_staff_id'],
      ),
    );
  }

  @override
  $DutyAssignmentTable createAlias(String alias) {
    return $DutyAssignmentTable(attachedDatabase, alias);
  }
}

class DutyAssignmentData extends DataClass
    implements Insertable<DutyAssignmentData> {
  final int id;
  final DateTime date;
  final String section;
  final int? inChargeStaffId;
  final int? qc2StaffId;
  const DutyAssignmentData({
    required this.id,
    required this.date,
    required this.section,
    this.inChargeStaffId,
    this.qc2StaffId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['section'] = Variable<String>(section);
    if (!nullToAbsent || inChargeStaffId != null) {
      map['in_charge_staff_id'] = Variable<int>(inChargeStaffId);
    }
    if (!nullToAbsent || qc2StaffId != null) {
      map['qc2_staff_id'] = Variable<int>(qc2StaffId);
    }
    return map;
  }

  DutyAssignmentCompanion toCompanion(bool nullToAbsent) {
    return DutyAssignmentCompanion(
      id: Value(id),
      date: Value(date),
      section: Value(section),
      inChargeStaffId: inChargeStaffId == null && nullToAbsent
          ? const Value.absent()
          : Value(inChargeStaffId),
      qc2StaffId: qc2StaffId == null && nullToAbsent
          ? const Value.absent()
          : Value(qc2StaffId),
    );
  }

  factory DutyAssignmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DutyAssignmentData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      section: serializer.fromJson<String>(json['section']),
      inChargeStaffId: serializer.fromJson<int?>(json['inChargeStaffId']),
      qc2StaffId: serializer.fromJson<int?>(json['qc2StaffId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'section': serializer.toJson<String>(section),
      'inChargeStaffId': serializer.toJson<int?>(inChargeStaffId),
      'qc2StaffId': serializer.toJson<int?>(qc2StaffId),
    };
  }

  DutyAssignmentData copyWith({
    int? id,
    DateTime? date,
    String? section,
    Value<int?> inChargeStaffId = const Value.absent(),
    Value<int?> qc2StaffId = const Value.absent(),
  }) => DutyAssignmentData(
    id: id ?? this.id,
    date: date ?? this.date,
    section: section ?? this.section,
    inChargeStaffId: inChargeStaffId.present
        ? inChargeStaffId.value
        : this.inChargeStaffId,
    qc2StaffId: qc2StaffId.present ? qc2StaffId.value : this.qc2StaffId,
  );
  DutyAssignmentData copyWithCompanion(DutyAssignmentCompanion data) {
    return DutyAssignmentData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      section: data.section.present ? data.section.value : this.section,
      inChargeStaffId: data.inChargeStaffId.present
          ? data.inChargeStaffId.value
          : this.inChargeStaffId,
      qc2StaffId: data.qc2StaffId.present
          ? data.qc2StaffId.value
          : this.qc2StaffId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DutyAssignmentData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('section: $section, ')
          ..write('inChargeStaffId: $inChargeStaffId, ')
          ..write('qc2StaffId: $qc2StaffId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, section, inChargeStaffId, qc2StaffId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DutyAssignmentData &&
          other.id == this.id &&
          other.date == this.date &&
          other.section == this.section &&
          other.inChargeStaffId == this.inChargeStaffId &&
          other.qc2StaffId == this.qc2StaffId);
}

class DutyAssignmentCompanion extends UpdateCompanion<DutyAssignmentData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> section;
  final Value<int?> inChargeStaffId;
  final Value<int?> qc2StaffId;
  const DutyAssignmentCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.section = const Value.absent(),
    this.inChargeStaffId = const Value.absent(),
    this.qc2StaffId = const Value.absent(),
  });
  DutyAssignmentCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String section,
    this.inChargeStaffId = const Value.absent(),
    this.qc2StaffId = const Value.absent(),
  }) : date = Value(date),
       section = Value(section);
  static Insertable<DutyAssignmentData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? section,
    Expression<int>? inChargeStaffId,
    Expression<int>? qc2StaffId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (section != null) 'section': section,
      if (inChargeStaffId != null) 'in_charge_staff_id': inChargeStaffId,
      if (qc2StaffId != null) 'qc2_staff_id': qc2StaffId,
    });
  }

  DutyAssignmentCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String>? section,
    Value<int?>? inChargeStaffId,
    Value<int?>? qc2StaffId,
  }) {
    return DutyAssignmentCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      section: section ?? this.section,
      inChargeStaffId: inChargeStaffId ?? this.inChargeStaffId,
      qc2StaffId: qc2StaffId ?? this.qc2StaffId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (section.present) {
      map['section'] = Variable<String>(section.value);
    }
    if (inChargeStaffId.present) {
      map['in_charge_staff_id'] = Variable<int>(inChargeStaffId.value);
    }
    if (qc2StaffId.present) {
      map['qc2_staff_id'] = Variable<int>(qc2StaffId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DutyAssignmentCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('section: $section, ')
          ..write('inChargeStaffId: $inChargeStaffId, ')
          ..write('qc2StaffId: $qc2StaffId')
          ..write(')'))
        .toString();
  }
}

class $ShiftCodeTable extends ShiftCode
    with TableInfo<$ShiftCodeTable, ShiftCodeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShiftCodeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hoursStartMeta = const VerificationMeta(
    'hoursStart',
  );
  @override
  late final GeneratedColumn<String> hoursStart = GeneratedColumn<String>(
    'hours_start',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hoursEndMeta = const VerificationMeta(
    'hoursEnd',
  );
  @override
  late final GeneratedColumn<String> hoursEnd = GeneratedColumn<String>(
    'hours_end',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    code,
    label,
    hoursStart,
    hoursEnd,
    colorHex,
    isCustom,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shift_code';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShiftCodeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('hours_start')) {
      context.handle(
        _hoursStartMeta,
        hoursStart.isAcceptableOrUnknown(data['hours_start']!, _hoursStartMeta),
      );
    }
    if (data.containsKey('hours_end')) {
      context.handle(
        _hoursEndMeta,
        hoursEnd.isAcceptableOrUnknown(data['hours_end']!, _hoursEndMeta),
      );
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  ShiftCodeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShiftCodeData(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      hoursStart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hours_start'],
      ),
      hoursEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hours_end'],
      ),
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      ),
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
    );
  }

  @override
  $ShiftCodeTable createAlias(String alias) {
    return $ShiftCodeTable(attachedDatabase, alias);
  }
}

class ShiftCodeData extends DataClass implements Insertable<ShiftCodeData> {
  final String code;
  final String label;
  final String? hoursStart;
  final String? hoursEnd;
  final String? colorHex;
  final bool isCustom;
  const ShiftCodeData({
    required this.code,
    required this.label,
    this.hoursStart,
    this.hoursEnd,
    this.colorHex,
    required this.isCustom,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || hoursStart != null) {
      map['hours_start'] = Variable<String>(hoursStart);
    }
    if (!nullToAbsent || hoursEnd != null) {
      map['hours_end'] = Variable<String>(hoursEnd);
    }
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['is_custom'] = Variable<bool>(isCustom);
    return map;
  }

  ShiftCodeCompanion toCompanion(bool nullToAbsent) {
    return ShiftCodeCompanion(
      code: Value(code),
      label: Value(label),
      hoursStart: hoursStart == null && nullToAbsent
          ? const Value.absent()
          : Value(hoursStart),
      hoursEnd: hoursEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(hoursEnd),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      isCustom: Value(isCustom),
    );
  }

  factory ShiftCodeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShiftCodeData(
      code: serializer.fromJson<String>(json['code']),
      label: serializer.fromJson<String>(json['label']),
      hoursStart: serializer.fromJson<String?>(json['hoursStart']),
      hoursEnd: serializer.fromJson<String?>(json['hoursEnd']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'label': serializer.toJson<String>(label),
      'hoursStart': serializer.toJson<String?>(hoursStart),
      'hoursEnd': serializer.toJson<String?>(hoursEnd),
      'colorHex': serializer.toJson<String?>(colorHex),
      'isCustom': serializer.toJson<bool>(isCustom),
    };
  }

  ShiftCodeData copyWith({
    String? code,
    String? label,
    Value<String?> hoursStart = const Value.absent(),
    Value<String?> hoursEnd = const Value.absent(),
    Value<String?> colorHex = const Value.absent(),
    bool? isCustom,
  }) => ShiftCodeData(
    code: code ?? this.code,
    label: label ?? this.label,
    hoursStart: hoursStart.present ? hoursStart.value : this.hoursStart,
    hoursEnd: hoursEnd.present ? hoursEnd.value : this.hoursEnd,
    colorHex: colorHex.present ? colorHex.value : this.colorHex,
    isCustom: isCustom ?? this.isCustom,
  );
  ShiftCodeData copyWithCompanion(ShiftCodeCompanion data) {
    return ShiftCodeData(
      code: data.code.present ? data.code.value : this.code,
      label: data.label.present ? data.label.value : this.label,
      hoursStart: data.hoursStart.present
          ? data.hoursStart.value
          : this.hoursStart,
      hoursEnd: data.hoursEnd.present ? data.hoursEnd.value : this.hoursEnd,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShiftCodeData(')
          ..write('code: $code, ')
          ..write('label: $label, ')
          ..write('hoursStart: $hoursStart, ')
          ..write('hoursEnd: $hoursEnd, ')
          ..write('colorHex: $colorHex, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, label, hoursStart, hoursEnd, colorHex, isCustom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShiftCodeData &&
          other.code == this.code &&
          other.label == this.label &&
          other.hoursStart == this.hoursStart &&
          other.hoursEnd == this.hoursEnd &&
          other.colorHex == this.colorHex &&
          other.isCustom == this.isCustom);
}

class ShiftCodeCompanion extends UpdateCompanion<ShiftCodeData> {
  final Value<String> code;
  final Value<String> label;
  final Value<String?> hoursStart;
  final Value<String?> hoursEnd;
  final Value<String?> colorHex;
  final Value<bool> isCustom;
  final Value<int> rowid;
  const ShiftCodeCompanion({
    this.code = const Value.absent(),
    this.label = const Value.absent(),
    this.hoursStart = const Value.absent(),
    this.hoursEnd = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShiftCodeCompanion.insert({
    required String code,
    required String label,
    this.hoursStart = const Value.absent(),
    this.hoursEnd = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       label = Value(label);
  static Insertable<ShiftCodeData> custom({
    Expression<String>? code,
    Expression<String>? label,
    Expression<String>? hoursStart,
    Expression<String>? hoursEnd,
    Expression<String>? colorHex,
    Expression<bool>? isCustom,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (label != null) 'label': label,
      if (hoursStart != null) 'hours_start': hoursStart,
      if (hoursEnd != null) 'hours_end': hoursEnd,
      if (colorHex != null) 'color_hex': colorHex,
      if (isCustom != null) 'is_custom': isCustom,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShiftCodeCompanion copyWith({
    Value<String>? code,
    Value<String>? label,
    Value<String?>? hoursStart,
    Value<String?>? hoursEnd,
    Value<String?>? colorHex,
    Value<bool>? isCustom,
    Value<int>? rowid,
  }) {
    return ShiftCodeCompanion(
      code: code ?? this.code,
      label: label ?? this.label,
      hoursStart: hoursStart ?? this.hoursStart,
      hoursEnd: hoursEnd ?? this.hoursEnd,
      colorHex: colorHex ?? this.colorHex,
      isCustom: isCustom ?? this.isCustom,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (hoursStart.present) {
      map['hours_start'] = Variable<String>(hoursStart.value);
    }
    if (hoursEnd.present) {
      map['hours_end'] = Variable<String>(hoursEnd.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShiftCodeCompanion(')
          ..write('code: $code, ')
          ..write('label: $label, ')
          ..write('hoursStart: $hoursStart, ')
          ..write('hoursEnd: $hoursEnd, ')
          ..write('colorHex: $colorHex, ')
          ..write('isCustom: $isCustom, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ManualCategoryTable extends ManualCategory
    with TableInfo<$ManualCategoryTable, ManualCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ManualCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, colorHex, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'manual_category';
  @override
  VerificationContext validateIntegrity(
    Insertable<ManualCategoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    } else if (isInserting) {
      context.missing(_colorHexMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ManualCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ManualCategoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
    );
  }

  @override
  $ManualCategoryTable createAlias(String alias) {
    return $ManualCategoryTable(attachedDatabase, alias);
  }
}

class ManualCategoryData extends DataClass
    implements Insertable<ManualCategoryData> {
  final int id;
  final String name;
  final String colorHex;
  final String icon;
  const ManualCategoryData({
    required this.id,
    required this.name,
    required this.colorHex,
    required this.icon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color_hex'] = Variable<String>(colorHex);
    map['icon'] = Variable<String>(icon);
    return map;
  }

  ManualCategoryCompanion toCompanion(bool nullToAbsent) {
    return ManualCategoryCompanion(
      id: Value(id),
      name: Value(name),
      colorHex: Value(colorHex),
      icon: Value(icon),
    );
  }

  factory ManualCategoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ManualCategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      icon: serializer.fromJson<String>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'colorHex': serializer.toJson<String>(colorHex),
      'icon': serializer.toJson<String>(icon),
    };
  }

  ManualCategoryData copyWith({
    int? id,
    String? name,
    String? colorHex,
    String? icon,
  }) => ManualCategoryData(
    id: id ?? this.id,
    name: name ?? this.name,
    colorHex: colorHex ?? this.colorHex,
    icon: icon ?? this.icon,
  );
  ManualCategoryData copyWithCompanion(ManualCategoryCompanion data) {
    return ManualCategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ManualCategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorHex, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ManualCategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorHex == this.colorHex &&
          other.icon == this.icon);
}

class ManualCategoryCompanion extends UpdateCompanion<ManualCategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> colorHex;
  final Value<String> icon;
  const ManualCategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.icon = const Value.absent(),
  });
  ManualCategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String colorHex,
    required String icon,
  }) : name = Value(name),
       colorHex = Value(colorHex),
       icon = Value(icon);
  static Insertable<ManualCategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? colorHex,
    Expression<String>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorHex != null) 'color_hex': colorHex,
      if (icon != null) 'icon': icon,
    });
  }

  ManualCategoryCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? colorHex,
    Value<String>? icon,
  }) {
    return ManualCategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ManualCategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $ManualDocumentTable extends ManualDocument
    with TableInfo<$ManualDocumentTable, ManualDocumentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ManualDocumentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES manual_category (id)',
    ),
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localFilePathMeta = const VerificationMeta(
    'localFilePath',
  );
  @override
  late final GeneratedColumn<String> localFilePath = GeneratedColumn<String>(
    'local_file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pageCountMeta = const VerificationMeta(
    'pageCount',
  );
  @override
  late final GeneratedColumn<int> pageCount = GeneratedColumn<int>(
    'page_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileSizeBytesMeta = const VerificationMeta(
    'fileSizeBytes',
  );
  @override
  late final GeneratedColumn<int> fileSizeBytes = GeneratedColumn<int>(
    'file_size_bytes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bodyTextMeta = const VerificationMeta(
    'bodyText',
  );
  @override
  late final GeneratedColumn<String> bodyText = GeneratedColumn<String>(
    'body_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _owningTeamMeta = const VerificationMeta(
    'owningTeam',
  );
  @override
  late final GeneratedColumn<String> owningTeam = GeneratedColumn<String>(
    'owning_team',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastOpenedAtMeta = const VerificationMeta(
    'lastOpenedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastOpenedAt = GeneratedColumn<DateTime>(
    'last_opened_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    categoryId,
    reference,
    version,
    description,
    fileType,
    localFilePath,
    pageCount,
    durationSeconds,
    fileSizeBytes,
    bodyText,
    owningTeam,
    createdAt,
    updatedAt,
    lastOpenedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'manual_document';
  @override
  VerificationContext validateIntegrity(
    Insertable<ManualDocumentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('local_file_path')) {
      context.handle(
        _localFilePathMeta,
        localFilePath.isAcceptableOrUnknown(
          data['local_file_path']!,
          _localFilePathMeta,
        ),
      );
    }
    if (data.containsKey('page_count')) {
      context.handle(
        _pageCountMeta,
        pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('file_size_bytes')) {
      context.handle(
        _fileSizeBytesMeta,
        fileSizeBytes.isAcceptableOrUnknown(
          data['file_size_bytes']!,
          _fileSizeBytesMeta,
        ),
      );
    }
    if (data.containsKey('body_text')) {
      context.handle(
        _bodyTextMeta,
        bodyText.isAcceptableOrUnknown(data['body_text']!, _bodyTextMeta),
      );
    }
    if (data.containsKey('owning_team')) {
      context.handle(
        _owningTeamMeta,
        owningTeam.isAcceptableOrUnknown(data['owning_team']!, _owningTeamMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('last_opened_at')) {
      context.handle(
        _lastOpenedAtMeta,
        lastOpenedAt.isAcceptableOrUnknown(
          data['last_opened_at']!,
          _lastOpenedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ManualDocumentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ManualDocumentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      localFilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_file_path'],
      ),
      pageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_count'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      fileSizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size_bytes'],
      ),
      bodyText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_text'],
      ),
      owningTeam: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owning_team'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      lastOpenedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_opened_at'],
      ),
    );
  }

  @override
  $ManualDocumentTable createAlias(String alias) {
    return $ManualDocumentTable(attachedDatabase, alias);
  }
}

class ManualDocumentData extends DataClass
    implements Insertable<ManualDocumentData> {
  final int id;
  final String title;
  final int categoryId;
  final String? reference;
  final String? version;
  final String? description;
  final String fileType;
  final String? localFilePath;
  final int? pageCount;
  final int? durationSeconds;
  final int? fileSizeBytes;
  final String? bodyText;
  final String? owningTeam;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastOpenedAt;
  const ManualDocumentData({
    required this.id,
    required this.title,
    required this.categoryId,
    this.reference,
    this.version,
    this.description,
    required this.fileType,
    this.localFilePath,
    this.pageCount,
    this.durationSeconds,
    this.fileSizeBytes,
    this.bodyText,
    this.owningTeam,
    required this.createdAt,
    required this.updatedAt,
    this.lastOpenedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<String>(version);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['file_type'] = Variable<String>(fileType);
    if (!nullToAbsent || localFilePath != null) {
      map['local_file_path'] = Variable<String>(localFilePath);
    }
    if (!nullToAbsent || pageCount != null) {
      map['page_count'] = Variable<int>(pageCount);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || fileSizeBytes != null) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes);
    }
    if (!nullToAbsent || bodyText != null) {
      map['body_text'] = Variable<String>(bodyText);
    }
    if (!nullToAbsent || owningTeam != null) {
      map['owning_team'] = Variable<String>(owningTeam);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || lastOpenedAt != null) {
      map['last_opened_at'] = Variable<DateTime>(lastOpenedAt);
    }
    return map;
  }

  ManualDocumentCompanion toCompanion(bool nullToAbsent) {
    return ManualDocumentCompanion(
      id: Value(id),
      title: Value(title),
      categoryId: Value(categoryId),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      fileType: Value(fileType),
      localFilePath: localFilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(localFilePath),
      pageCount: pageCount == null && nullToAbsent
          ? const Value.absent()
          : Value(pageCount),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      fileSizeBytes: fileSizeBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(fileSizeBytes),
      bodyText: bodyText == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyText),
      owningTeam: owningTeam == null && nullToAbsent
          ? const Value.absent()
          : Value(owningTeam),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastOpenedAt: lastOpenedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastOpenedAt),
    );
  }

  factory ManualDocumentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ManualDocumentData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      reference: serializer.fromJson<String?>(json['reference']),
      version: serializer.fromJson<String?>(json['version']),
      description: serializer.fromJson<String?>(json['description']),
      fileType: serializer.fromJson<String>(json['fileType']),
      localFilePath: serializer.fromJson<String?>(json['localFilePath']),
      pageCount: serializer.fromJson<int?>(json['pageCount']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      fileSizeBytes: serializer.fromJson<int?>(json['fileSizeBytes']),
      bodyText: serializer.fromJson<String?>(json['bodyText']),
      owningTeam: serializer.fromJson<String?>(json['owningTeam']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastOpenedAt: serializer.fromJson<DateTime?>(json['lastOpenedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'categoryId': serializer.toJson<int>(categoryId),
      'reference': serializer.toJson<String?>(reference),
      'version': serializer.toJson<String?>(version),
      'description': serializer.toJson<String?>(description),
      'fileType': serializer.toJson<String>(fileType),
      'localFilePath': serializer.toJson<String?>(localFilePath),
      'pageCount': serializer.toJson<int?>(pageCount),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'fileSizeBytes': serializer.toJson<int?>(fileSizeBytes),
      'bodyText': serializer.toJson<String?>(bodyText),
      'owningTeam': serializer.toJson<String?>(owningTeam),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastOpenedAt': serializer.toJson<DateTime?>(lastOpenedAt),
    };
  }

  ManualDocumentData copyWith({
    int? id,
    String? title,
    int? categoryId,
    Value<String?> reference = const Value.absent(),
    Value<String?> version = const Value.absent(),
    Value<String?> description = const Value.absent(),
    String? fileType,
    Value<String?> localFilePath = const Value.absent(),
    Value<int?> pageCount = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
    Value<int?> fileSizeBytes = const Value.absent(),
    Value<String?> bodyText = const Value.absent(),
    Value<String?> owningTeam = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> lastOpenedAt = const Value.absent(),
  }) => ManualDocumentData(
    id: id ?? this.id,
    title: title ?? this.title,
    categoryId: categoryId ?? this.categoryId,
    reference: reference.present ? reference.value : this.reference,
    version: version.present ? version.value : this.version,
    description: description.present ? description.value : this.description,
    fileType: fileType ?? this.fileType,
    localFilePath: localFilePath.present
        ? localFilePath.value
        : this.localFilePath,
    pageCount: pageCount.present ? pageCount.value : this.pageCount,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    fileSizeBytes: fileSizeBytes.present
        ? fileSizeBytes.value
        : this.fileSizeBytes,
    bodyText: bodyText.present ? bodyText.value : this.bodyText,
    owningTeam: owningTeam.present ? owningTeam.value : this.owningTeam,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    lastOpenedAt: lastOpenedAt.present ? lastOpenedAt.value : this.lastOpenedAt,
  );
  ManualDocumentData copyWithCompanion(ManualDocumentCompanion data) {
    return ManualDocumentData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      reference: data.reference.present ? data.reference.value : this.reference,
      version: data.version.present ? data.version.value : this.version,
      description: data.description.present
          ? data.description.value
          : this.description,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      localFilePath: data.localFilePath.present
          ? data.localFilePath.value
          : this.localFilePath,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      fileSizeBytes: data.fileSizeBytes.present
          ? data.fileSizeBytes.value
          : this.fileSizeBytes,
      bodyText: data.bodyText.present ? data.bodyText.value : this.bodyText,
      owningTeam: data.owningTeam.present
          ? data.owningTeam.value
          : this.owningTeam,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastOpenedAt: data.lastOpenedAt.present
          ? data.lastOpenedAt.value
          : this.lastOpenedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ManualDocumentData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('categoryId: $categoryId, ')
          ..write('reference: $reference, ')
          ..write('version: $version, ')
          ..write('description: $description, ')
          ..write('fileType: $fileType, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('pageCount: $pageCount, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('bodyText: $bodyText, ')
          ..write('owningTeam: $owningTeam, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastOpenedAt: $lastOpenedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    categoryId,
    reference,
    version,
    description,
    fileType,
    localFilePath,
    pageCount,
    durationSeconds,
    fileSizeBytes,
    bodyText,
    owningTeam,
    createdAt,
    updatedAt,
    lastOpenedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ManualDocumentData &&
          other.id == this.id &&
          other.title == this.title &&
          other.categoryId == this.categoryId &&
          other.reference == this.reference &&
          other.version == this.version &&
          other.description == this.description &&
          other.fileType == this.fileType &&
          other.localFilePath == this.localFilePath &&
          other.pageCount == this.pageCount &&
          other.durationSeconds == this.durationSeconds &&
          other.fileSizeBytes == this.fileSizeBytes &&
          other.bodyText == this.bodyText &&
          other.owningTeam == this.owningTeam &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastOpenedAt == this.lastOpenedAt);
}

class ManualDocumentCompanion extends UpdateCompanion<ManualDocumentData> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> categoryId;
  final Value<String?> reference;
  final Value<String?> version;
  final Value<String?> description;
  final Value<String> fileType;
  final Value<String?> localFilePath;
  final Value<int?> pageCount;
  final Value<int?> durationSeconds;
  final Value<int?> fileSizeBytes;
  final Value<String?> bodyText;
  final Value<String?> owningTeam;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> lastOpenedAt;
  const ManualDocumentCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.reference = const Value.absent(),
    this.version = const Value.absent(),
    this.description = const Value.absent(),
    this.fileType = const Value.absent(),
    this.localFilePath = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.bodyText = const Value.absent(),
    this.owningTeam = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastOpenedAt = const Value.absent(),
  });
  ManualDocumentCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int categoryId,
    this.reference = const Value.absent(),
    this.version = const Value.absent(),
    this.description = const Value.absent(),
    required String fileType,
    this.localFilePath = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.bodyText = const Value.absent(),
    this.owningTeam = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.lastOpenedAt = const Value.absent(),
  }) : title = Value(title),
       categoryId = Value(categoryId),
       fileType = Value(fileType),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ManualDocumentData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? categoryId,
    Expression<String>? reference,
    Expression<String>? version,
    Expression<String>? description,
    Expression<String>? fileType,
    Expression<String>? localFilePath,
    Expression<int>? pageCount,
    Expression<int>? durationSeconds,
    Expression<int>? fileSizeBytes,
    Expression<String>? bodyText,
    Expression<String>? owningTeam,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? lastOpenedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (categoryId != null) 'category_id': categoryId,
      if (reference != null) 'reference': reference,
      if (version != null) 'version': version,
      if (description != null) 'description': description,
      if (fileType != null) 'file_type': fileType,
      if (localFilePath != null) 'local_file_path': localFilePath,
      if (pageCount != null) 'page_count': pageCount,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (fileSizeBytes != null) 'file_size_bytes': fileSizeBytes,
      if (bodyText != null) 'body_text': bodyText,
      if (owningTeam != null) 'owning_team': owningTeam,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastOpenedAt != null) 'last_opened_at': lastOpenedAt,
    });
  }

  ManualDocumentCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<int>? categoryId,
    Value<String?>? reference,
    Value<String?>? version,
    Value<String?>? description,
    Value<String>? fileType,
    Value<String?>? localFilePath,
    Value<int?>? pageCount,
    Value<int?>? durationSeconds,
    Value<int?>? fileSizeBytes,
    Value<String?>? bodyText,
    Value<String?>? owningTeam,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? lastOpenedAt,
  }) {
    return ManualDocumentCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      categoryId: categoryId ?? this.categoryId,
      reference: reference ?? this.reference,
      version: version ?? this.version,
      description: description ?? this.description,
      fileType: fileType ?? this.fileType,
      localFilePath: localFilePath ?? this.localFilePath,
      pageCount: pageCount ?? this.pageCount,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      bodyText: bodyText ?? this.bodyText,
      owningTeam: owningTeam ?? this.owningTeam,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (localFilePath.present) {
      map['local_file_path'] = Variable<String>(localFilePath.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (fileSizeBytes.present) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes.value);
    }
    if (bodyText.present) {
      map['body_text'] = Variable<String>(bodyText.value);
    }
    if (owningTeam.present) {
      map['owning_team'] = Variable<String>(owningTeam.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastOpenedAt.present) {
      map['last_opened_at'] = Variable<DateTime>(lastOpenedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ManualDocumentCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('categoryId: $categoryId, ')
          ..write('reference: $reference, ')
          ..write('version: $version, ')
          ..write('description: $description, ')
          ..write('fileType: $fileType, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('pageCount: $pageCount, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('bodyText: $bodyText, ')
          ..write('owningTeam: $owningTeam, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastOpenedAt: $lastOpenedAt')
          ..write(')'))
        .toString();
  }
}

class $SegContentCategoryRowTable extends SegContentCategoryRow
    with TableInfo<$SegContentCategoryRowTable, SegContentCategoryRowData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SegContentCategoryRowTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _contentCategoryMeta = const VerificationMeta(
    'contentCategory',
  );
  @override
  late final GeneratedColumn<String> contentCategory = GeneratedColumn<String>(
    'content_category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shahidSegmentationMeta =
      const VerificationMeta('shahidSegmentation');
  @override
  late final GeneratedColumn<String> shahidSegmentation =
      GeneratedColumn<String>(
        'shahid_segmentation',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mbcSegmentationMeta = const VerificationMeta(
    'mbcSegmentation',
  );
  @override
  late final GeneratedColumn<String> mbcSegmentation = GeneratedColumn<String>(
    'mbc_segmentation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requiredNotesMeta = const VerificationMeta(
    'requiredNotes',
  );
  @override
  late final GeneratedColumn<String> requiredNotes = GeneratedColumn<String>(
    'required_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _examplesMeta = const VerificationMeta(
    'examples',
  );
  @override
  late final GeneratedColumn<String> examples = GeneratedColumn<String>(
    'examples',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    contentCategory,
    shahidSegmentation,
    mbcSegmentation,
    requiredNotes,
    examples,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'seg_content_category_row';
  @override
  VerificationContext validateIntegrity(
    Insertable<SegContentCategoryRowData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content_category')) {
      context.handle(
        _contentCategoryMeta,
        contentCategory.isAcceptableOrUnknown(
          data['content_category']!,
          _contentCategoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentCategoryMeta);
    }
    if (data.containsKey('shahid_segmentation')) {
      context.handle(
        _shahidSegmentationMeta,
        shahidSegmentation.isAcceptableOrUnknown(
          data['shahid_segmentation']!,
          _shahidSegmentationMeta,
        ),
      );
    }
    if (data.containsKey('mbc_segmentation')) {
      context.handle(
        _mbcSegmentationMeta,
        mbcSegmentation.isAcceptableOrUnknown(
          data['mbc_segmentation']!,
          _mbcSegmentationMeta,
        ),
      );
    }
    if (data.containsKey('required_notes')) {
      context.handle(
        _requiredNotesMeta,
        requiredNotes.isAcceptableOrUnknown(
          data['required_notes']!,
          _requiredNotesMeta,
        ),
      );
    }
    if (data.containsKey('examples')) {
      context.handle(
        _examplesMeta,
        examples.isAcceptableOrUnknown(data['examples']!, _examplesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SegContentCategoryRowData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SegContentCategoryRowData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      contentCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_category'],
      )!,
      shahidSegmentation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shahid_segmentation'],
      ),
      mbcSegmentation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mbc_segmentation'],
      ),
      requiredNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}required_notes'],
      ),
      examples: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}examples'],
      ),
    );
  }

  @override
  $SegContentCategoryRowTable createAlias(String alias) {
    return $SegContentCategoryRowTable(attachedDatabase, alias);
  }
}

class SegContentCategoryRowData extends DataClass
    implements Insertable<SegContentCategoryRowData> {
  final int id;
  final String contentCategory;
  final String? shahidSegmentation;
  final String? mbcSegmentation;
  final String? requiredNotes;
  final String? examples;
  const SegContentCategoryRowData({
    required this.id,
    required this.contentCategory,
    this.shahidSegmentation,
    this.mbcSegmentation,
    this.requiredNotes,
    this.examples,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content_category'] = Variable<String>(contentCategory);
    if (!nullToAbsent || shahidSegmentation != null) {
      map['shahid_segmentation'] = Variable<String>(shahidSegmentation);
    }
    if (!nullToAbsent || mbcSegmentation != null) {
      map['mbc_segmentation'] = Variable<String>(mbcSegmentation);
    }
    if (!nullToAbsent || requiredNotes != null) {
      map['required_notes'] = Variable<String>(requiredNotes);
    }
    if (!nullToAbsent || examples != null) {
      map['examples'] = Variable<String>(examples);
    }
    return map;
  }

  SegContentCategoryRowCompanion toCompanion(bool nullToAbsent) {
    return SegContentCategoryRowCompanion(
      id: Value(id),
      contentCategory: Value(contentCategory),
      shahidSegmentation: shahidSegmentation == null && nullToAbsent
          ? const Value.absent()
          : Value(shahidSegmentation),
      mbcSegmentation: mbcSegmentation == null && nullToAbsent
          ? const Value.absent()
          : Value(mbcSegmentation),
      requiredNotes: requiredNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(requiredNotes),
      examples: examples == null && nullToAbsent
          ? const Value.absent()
          : Value(examples),
    );
  }

  factory SegContentCategoryRowData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SegContentCategoryRowData(
      id: serializer.fromJson<int>(json['id']),
      contentCategory: serializer.fromJson<String>(json['contentCategory']),
      shahidSegmentation: serializer.fromJson<String?>(
        json['shahidSegmentation'],
      ),
      mbcSegmentation: serializer.fromJson<String?>(json['mbcSegmentation']),
      requiredNotes: serializer.fromJson<String?>(json['requiredNotes']),
      examples: serializer.fromJson<String?>(json['examples']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'contentCategory': serializer.toJson<String>(contentCategory),
      'shahidSegmentation': serializer.toJson<String?>(shahidSegmentation),
      'mbcSegmentation': serializer.toJson<String?>(mbcSegmentation),
      'requiredNotes': serializer.toJson<String?>(requiredNotes),
      'examples': serializer.toJson<String?>(examples),
    };
  }

  SegContentCategoryRowData copyWith({
    int? id,
    String? contentCategory,
    Value<String?> shahidSegmentation = const Value.absent(),
    Value<String?> mbcSegmentation = const Value.absent(),
    Value<String?> requiredNotes = const Value.absent(),
    Value<String?> examples = const Value.absent(),
  }) => SegContentCategoryRowData(
    id: id ?? this.id,
    contentCategory: contentCategory ?? this.contentCategory,
    shahidSegmentation: shahidSegmentation.present
        ? shahidSegmentation.value
        : this.shahidSegmentation,
    mbcSegmentation: mbcSegmentation.present
        ? mbcSegmentation.value
        : this.mbcSegmentation,
    requiredNotes: requiredNotes.present
        ? requiredNotes.value
        : this.requiredNotes,
    examples: examples.present ? examples.value : this.examples,
  );
  SegContentCategoryRowData copyWithCompanion(
    SegContentCategoryRowCompanion data,
  ) {
    return SegContentCategoryRowData(
      id: data.id.present ? data.id.value : this.id,
      contentCategory: data.contentCategory.present
          ? data.contentCategory.value
          : this.contentCategory,
      shahidSegmentation: data.shahidSegmentation.present
          ? data.shahidSegmentation.value
          : this.shahidSegmentation,
      mbcSegmentation: data.mbcSegmentation.present
          ? data.mbcSegmentation.value
          : this.mbcSegmentation,
      requiredNotes: data.requiredNotes.present
          ? data.requiredNotes.value
          : this.requiredNotes,
      examples: data.examples.present ? data.examples.value : this.examples,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SegContentCategoryRowData(')
          ..write('id: $id, ')
          ..write('contentCategory: $contentCategory, ')
          ..write('shahidSegmentation: $shahidSegmentation, ')
          ..write('mbcSegmentation: $mbcSegmentation, ')
          ..write('requiredNotes: $requiredNotes, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    contentCategory,
    shahidSegmentation,
    mbcSegmentation,
    requiredNotes,
    examples,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SegContentCategoryRowData &&
          other.id == this.id &&
          other.contentCategory == this.contentCategory &&
          other.shahidSegmentation == this.shahidSegmentation &&
          other.mbcSegmentation == this.mbcSegmentation &&
          other.requiredNotes == this.requiredNotes &&
          other.examples == this.examples);
}

class SegContentCategoryRowCompanion
    extends UpdateCompanion<SegContentCategoryRowData> {
  final Value<int> id;
  final Value<String> contentCategory;
  final Value<String?> shahidSegmentation;
  final Value<String?> mbcSegmentation;
  final Value<String?> requiredNotes;
  final Value<String?> examples;
  const SegContentCategoryRowCompanion({
    this.id = const Value.absent(),
    this.contentCategory = const Value.absent(),
    this.shahidSegmentation = const Value.absent(),
    this.mbcSegmentation = const Value.absent(),
    this.requiredNotes = const Value.absent(),
    this.examples = const Value.absent(),
  });
  SegContentCategoryRowCompanion.insert({
    this.id = const Value.absent(),
    required String contentCategory,
    this.shahidSegmentation = const Value.absent(),
    this.mbcSegmentation = const Value.absent(),
    this.requiredNotes = const Value.absent(),
    this.examples = const Value.absent(),
  }) : contentCategory = Value(contentCategory);
  static Insertable<SegContentCategoryRowData> custom({
    Expression<int>? id,
    Expression<String>? contentCategory,
    Expression<String>? shahidSegmentation,
    Expression<String>? mbcSegmentation,
    Expression<String>? requiredNotes,
    Expression<String>? examples,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contentCategory != null) 'content_category': contentCategory,
      if (shahidSegmentation != null) 'shahid_segmentation': shahidSegmentation,
      if (mbcSegmentation != null) 'mbc_segmentation': mbcSegmentation,
      if (requiredNotes != null) 'required_notes': requiredNotes,
      if (examples != null) 'examples': examples,
    });
  }

  SegContentCategoryRowCompanion copyWith({
    Value<int>? id,
    Value<String>? contentCategory,
    Value<String?>? shahidSegmentation,
    Value<String?>? mbcSegmentation,
    Value<String?>? requiredNotes,
    Value<String?>? examples,
  }) {
    return SegContentCategoryRowCompanion(
      id: id ?? this.id,
      contentCategory: contentCategory ?? this.contentCategory,
      shahidSegmentation: shahidSegmentation ?? this.shahidSegmentation,
      mbcSegmentation: mbcSegmentation ?? this.mbcSegmentation,
      requiredNotes: requiredNotes ?? this.requiredNotes,
      examples: examples ?? this.examples,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (contentCategory.present) {
      map['content_category'] = Variable<String>(contentCategory.value);
    }
    if (shahidSegmentation.present) {
      map['shahid_segmentation'] = Variable<String>(shahidSegmentation.value);
    }
    if (mbcSegmentation.present) {
      map['mbc_segmentation'] = Variable<String>(mbcSegmentation.value);
    }
    if (requiredNotes.present) {
      map['required_notes'] = Variable<String>(requiredNotes.value);
    }
    if (examples.present) {
      map['examples'] = Variable<String>(examples.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SegContentCategoryRowCompanion(')
          ..write('id: $id, ')
          ..write('contentCategory: $contentCategory, ')
          ..write('shahidSegmentation: $shahidSegmentation, ')
          ..write('mbcSegmentation: $mbcSegmentation, ')
          ..write('requiredNotes: $requiredNotes, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }
}

class $SegSpecialFileGroupRowTable extends SegSpecialFileGroupRow
    with TableInfo<$SegSpecialFileGroupRowTable, SegSpecialFileGroupRowData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SegSpecialFileGroupRowTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fileGroupMeta = const VerificationMeta(
    'fileGroup',
  );
  @override
  late final GeneratedColumn<String> fileGroup = GeneratedColumn<String>(
    'file_group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usageMeta = const VerificationMeta('usage');
  @override
  late final GeneratedColumn<String> usage = GeneratedColumn<String>(
    'usage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
    'channel',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requiredTreatmentMeta = const VerificationMeta(
    'requiredTreatment',
  );
  @override
  late final GeneratedColumn<String> requiredTreatment =
      GeneratedColumn<String>(
        'required_treatment',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fileGroup,
    usage,
    channel,
    requiredTreatment,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'seg_special_file_group_row';
  @override
  VerificationContext validateIntegrity(
    Insertable<SegSpecialFileGroupRowData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file_group')) {
      context.handle(
        _fileGroupMeta,
        fileGroup.isAcceptableOrUnknown(data['file_group']!, _fileGroupMeta),
      );
    } else if (isInserting) {
      context.missing(_fileGroupMeta);
    }
    if (data.containsKey('usage')) {
      context.handle(
        _usageMeta,
        usage.isAcceptableOrUnknown(data['usage']!, _usageMeta),
      );
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    }
    if (data.containsKey('required_treatment')) {
      context.handle(
        _requiredTreatmentMeta,
        requiredTreatment.isAcceptableOrUnknown(
          data['required_treatment']!,
          _requiredTreatmentMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SegSpecialFileGroupRowData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SegSpecialFileGroupRowData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fileGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_group'],
      )!,
      usage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usage'],
      ),
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel'],
      ),
      requiredTreatment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}required_treatment'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $SegSpecialFileGroupRowTable createAlias(String alias) {
    return $SegSpecialFileGroupRowTable(attachedDatabase, alias);
  }
}

class SegSpecialFileGroupRowData extends DataClass
    implements Insertable<SegSpecialFileGroupRowData> {
  final int id;
  final String fileGroup;
  final String? usage;
  final String? channel;
  final String? requiredTreatment;
  final String? notes;
  const SegSpecialFileGroupRowData({
    required this.id,
    required this.fileGroup,
    this.usage,
    this.channel,
    this.requiredTreatment,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['file_group'] = Variable<String>(fileGroup);
    if (!nullToAbsent || usage != null) {
      map['usage'] = Variable<String>(usage);
    }
    if (!nullToAbsent || channel != null) {
      map['channel'] = Variable<String>(channel);
    }
    if (!nullToAbsent || requiredTreatment != null) {
      map['required_treatment'] = Variable<String>(requiredTreatment);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SegSpecialFileGroupRowCompanion toCompanion(bool nullToAbsent) {
    return SegSpecialFileGroupRowCompanion(
      id: Value(id),
      fileGroup: Value(fileGroup),
      usage: usage == null && nullToAbsent
          ? const Value.absent()
          : Value(usage),
      channel: channel == null && nullToAbsent
          ? const Value.absent()
          : Value(channel),
      requiredTreatment: requiredTreatment == null && nullToAbsent
          ? const Value.absent()
          : Value(requiredTreatment),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory SegSpecialFileGroupRowData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SegSpecialFileGroupRowData(
      id: serializer.fromJson<int>(json['id']),
      fileGroup: serializer.fromJson<String>(json['fileGroup']),
      usage: serializer.fromJson<String?>(json['usage']),
      channel: serializer.fromJson<String?>(json['channel']),
      requiredTreatment: serializer.fromJson<String?>(
        json['requiredTreatment'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fileGroup': serializer.toJson<String>(fileGroup),
      'usage': serializer.toJson<String?>(usage),
      'channel': serializer.toJson<String?>(channel),
      'requiredTreatment': serializer.toJson<String?>(requiredTreatment),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  SegSpecialFileGroupRowData copyWith({
    int? id,
    String? fileGroup,
    Value<String?> usage = const Value.absent(),
    Value<String?> channel = const Value.absent(),
    Value<String?> requiredTreatment = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => SegSpecialFileGroupRowData(
    id: id ?? this.id,
    fileGroup: fileGroup ?? this.fileGroup,
    usage: usage.present ? usage.value : this.usage,
    channel: channel.present ? channel.value : this.channel,
    requiredTreatment: requiredTreatment.present
        ? requiredTreatment.value
        : this.requiredTreatment,
    notes: notes.present ? notes.value : this.notes,
  );
  SegSpecialFileGroupRowData copyWithCompanion(
    SegSpecialFileGroupRowCompanion data,
  ) {
    return SegSpecialFileGroupRowData(
      id: data.id.present ? data.id.value : this.id,
      fileGroup: data.fileGroup.present ? data.fileGroup.value : this.fileGroup,
      usage: data.usage.present ? data.usage.value : this.usage,
      channel: data.channel.present ? data.channel.value : this.channel,
      requiredTreatment: data.requiredTreatment.present
          ? data.requiredTreatment.value
          : this.requiredTreatment,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SegSpecialFileGroupRowData(')
          ..write('id: $id, ')
          ..write('fileGroup: $fileGroup, ')
          ..write('usage: $usage, ')
          ..write('channel: $channel, ')
          ..write('requiredTreatment: $requiredTreatment, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fileGroup, usage, channel, requiredTreatment, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SegSpecialFileGroupRowData &&
          other.id == this.id &&
          other.fileGroup == this.fileGroup &&
          other.usage == this.usage &&
          other.channel == this.channel &&
          other.requiredTreatment == this.requiredTreatment &&
          other.notes == this.notes);
}

class SegSpecialFileGroupRowCompanion
    extends UpdateCompanion<SegSpecialFileGroupRowData> {
  final Value<int> id;
  final Value<String> fileGroup;
  final Value<String?> usage;
  final Value<String?> channel;
  final Value<String?> requiredTreatment;
  final Value<String?> notes;
  const SegSpecialFileGroupRowCompanion({
    this.id = const Value.absent(),
    this.fileGroup = const Value.absent(),
    this.usage = const Value.absent(),
    this.channel = const Value.absent(),
    this.requiredTreatment = const Value.absent(),
    this.notes = const Value.absent(),
  });
  SegSpecialFileGroupRowCompanion.insert({
    this.id = const Value.absent(),
    required String fileGroup,
    this.usage = const Value.absent(),
    this.channel = const Value.absent(),
    this.requiredTreatment = const Value.absent(),
    this.notes = const Value.absent(),
  }) : fileGroup = Value(fileGroup);
  static Insertable<SegSpecialFileGroupRowData> custom({
    Expression<int>? id,
    Expression<String>? fileGroup,
    Expression<String>? usage,
    Expression<String>? channel,
    Expression<String>? requiredTreatment,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileGroup != null) 'file_group': fileGroup,
      if (usage != null) 'usage': usage,
      if (channel != null) 'channel': channel,
      if (requiredTreatment != null) 'required_treatment': requiredTreatment,
      if (notes != null) 'notes': notes,
    });
  }

  SegSpecialFileGroupRowCompanion copyWith({
    Value<int>? id,
    Value<String>? fileGroup,
    Value<String?>? usage,
    Value<String?>? channel,
    Value<String?>? requiredTreatment,
    Value<String?>? notes,
  }) {
    return SegSpecialFileGroupRowCompanion(
      id: id ?? this.id,
      fileGroup: fileGroup ?? this.fileGroup,
      usage: usage ?? this.usage,
      channel: channel ?? this.channel,
      requiredTreatment: requiredTreatment ?? this.requiredTreatment,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fileGroup.present) {
      map['file_group'] = Variable<String>(fileGroup.value);
    }
    if (usage.present) {
      map['usage'] = Variable<String>(usage.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (requiredTreatment.present) {
      map['required_treatment'] = Variable<String>(requiredTreatment.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SegSpecialFileGroupRowCompanion(')
          ..write('id: $id, ')
          ..write('fileGroup: $fileGroup, ')
          ..write('usage: $usage, ')
          ..write('channel: $channel, ')
          ..write('requiredTreatment: $requiredTreatment, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $SegGlossaryRowTable extends SegGlossaryRow
    with TableInfo<$SegGlossaryRowTable, SegGlossaryRowData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SegGlossaryRowTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _termMeta = const VerificationMeta('term');
  @override
  late final GeneratedColumn<String> term = GeneratedColumn<String>(
    'term',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _meaningMeta = const VerificationMeta(
    'meaning',
  );
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
    'meaning',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exampleMeta = const VerificationMeta(
    'example',
  );
  @override
  late final GeneratedColumn<String> example = GeneratedColumn<String>(
    'example',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedProcedureMeta = const VerificationMeta(
    'relatedProcedure',
  );
  @override
  late final GeneratedColumn<String> relatedProcedure = GeneratedColumn<String>(
    'related_procedure',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    term,
    meaning,
    example,
    relatedProcedure,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'seg_glossary_row';
  @override
  VerificationContext validateIntegrity(
    Insertable<SegGlossaryRowData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('term')) {
      context.handle(
        _termMeta,
        term.isAcceptableOrUnknown(data['term']!, _termMeta),
      );
    } else if (isInserting) {
      context.missing(_termMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(
        _meaningMeta,
        meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta),
      );
    }
    if (data.containsKey('example')) {
      context.handle(
        _exampleMeta,
        example.isAcceptableOrUnknown(data['example']!, _exampleMeta),
      );
    }
    if (data.containsKey('related_procedure')) {
      context.handle(
        _relatedProcedureMeta,
        relatedProcedure.isAcceptableOrUnknown(
          data['related_procedure']!,
          _relatedProcedureMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SegGlossaryRowData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SegGlossaryRowData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      term: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}term'],
      )!,
      meaning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meaning'],
      ),
      example: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}example'],
      ),
      relatedProcedure: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_procedure'],
      ),
    );
  }

  @override
  $SegGlossaryRowTable createAlias(String alias) {
    return $SegGlossaryRowTable(attachedDatabase, alias);
  }
}

class SegGlossaryRowData extends DataClass
    implements Insertable<SegGlossaryRowData> {
  final int id;
  final String term;
  final String? meaning;
  final String? example;
  final String? relatedProcedure;
  const SegGlossaryRowData({
    required this.id,
    required this.term,
    this.meaning,
    this.example,
    this.relatedProcedure,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['term'] = Variable<String>(term);
    if (!nullToAbsent || meaning != null) {
      map['meaning'] = Variable<String>(meaning);
    }
    if (!nullToAbsent || example != null) {
      map['example'] = Variable<String>(example);
    }
    if (!nullToAbsent || relatedProcedure != null) {
      map['related_procedure'] = Variable<String>(relatedProcedure);
    }
    return map;
  }

  SegGlossaryRowCompanion toCompanion(bool nullToAbsent) {
    return SegGlossaryRowCompanion(
      id: Value(id),
      term: Value(term),
      meaning: meaning == null && nullToAbsent
          ? const Value.absent()
          : Value(meaning),
      example: example == null && nullToAbsent
          ? const Value.absent()
          : Value(example),
      relatedProcedure: relatedProcedure == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedProcedure),
    );
  }

  factory SegGlossaryRowData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SegGlossaryRowData(
      id: serializer.fromJson<int>(json['id']),
      term: serializer.fromJson<String>(json['term']),
      meaning: serializer.fromJson<String?>(json['meaning']),
      example: serializer.fromJson<String?>(json['example']),
      relatedProcedure: serializer.fromJson<String?>(json['relatedProcedure']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'term': serializer.toJson<String>(term),
      'meaning': serializer.toJson<String?>(meaning),
      'example': serializer.toJson<String?>(example),
      'relatedProcedure': serializer.toJson<String?>(relatedProcedure),
    };
  }

  SegGlossaryRowData copyWith({
    int? id,
    String? term,
    Value<String?> meaning = const Value.absent(),
    Value<String?> example = const Value.absent(),
    Value<String?> relatedProcedure = const Value.absent(),
  }) => SegGlossaryRowData(
    id: id ?? this.id,
    term: term ?? this.term,
    meaning: meaning.present ? meaning.value : this.meaning,
    example: example.present ? example.value : this.example,
    relatedProcedure: relatedProcedure.present
        ? relatedProcedure.value
        : this.relatedProcedure,
  );
  SegGlossaryRowData copyWithCompanion(SegGlossaryRowCompanion data) {
    return SegGlossaryRowData(
      id: data.id.present ? data.id.value : this.id,
      term: data.term.present ? data.term.value : this.term,
      meaning: data.meaning.present ? data.meaning.value : this.meaning,
      example: data.example.present ? data.example.value : this.example,
      relatedProcedure: data.relatedProcedure.present
          ? data.relatedProcedure.value
          : this.relatedProcedure,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SegGlossaryRowData(')
          ..write('id: $id, ')
          ..write('term: $term, ')
          ..write('meaning: $meaning, ')
          ..write('example: $example, ')
          ..write('relatedProcedure: $relatedProcedure')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, term, meaning, example, relatedProcedure);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SegGlossaryRowData &&
          other.id == this.id &&
          other.term == this.term &&
          other.meaning == this.meaning &&
          other.example == this.example &&
          other.relatedProcedure == this.relatedProcedure);
}

class SegGlossaryRowCompanion extends UpdateCompanion<SegGlossaryRowData> {
  final Value<int> id;
  final Value<String> term;
  final Value<String?> meaning;
  final Value<String?> example;
  final Value<String?> relatedProcedure;
  const SegGlossaryRowCompanion({
    this.id = const Value.absent(),
    this.term = const Value.absent(),
    this.meaning = const Value.absent(),
    this.example = const Value.absent(),
    this.relatedProcedure = const Value.absent(),
  });
  SegGlossaryRowCompanion.insert({
    this.id = const Value.absent(),
    required String term,
    this.meaning = const Value.absent(),
    this.example = const Value.absent(),
    this.relatedProcedure = const Value.absent(),
  }) : term = Value(term);
  static Insertable<SegGlossaryRowData> custom({
    Expression<int>? id,
    Expression<String>? term,
    Expression<String>? meaning,
    Expression<String>? example,
    Expression<String>? relatedProcedure,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (term != null) 'term': term,
      if (meaning != null) 'meaning': meaning,
      if (example != null) 'example': example,
      if (relatedProcedure != null) 'related_procedure': relatedProcedure,
    });
  }

  SegGlossaryRowCompanion copyWith({
    Value<int>? id,
    Value<String>? term,
    Value<String?>? meaning,
    Value<String?>? example,
    Value<String?>? relatedProcedure,
  }) {
    return SegGlossaryRowCompanion(
      id: id ?? this.id,
      term: term ?? this.term,
      meaning: meaning ?? this.meaning,
      example: example ?? this.example,
      relatedProcedure: relatedProcedure ?? this.relatedProcedure,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (term.present) {
      map['term'] = Variable<String>(term.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (example.present) {
      map['example'] = Variable<String>(example.value);
    }
    if (relatedProcedure.present) {
      map['related_procedure'] = Variable<String>(relatedProcedure.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SegGlossaryRowCompanion(')
          ..write('id: $id, ')
          ..write('term: $term, ')
          ..write('meaning: $meaning, ')
          ..write('example: $example, ')
          ..write('relatedProcedure: $relatedProcedure')
          ..write(')'))
        .toString();
  }
}

class $ContactTable extends Contact with TableInfo<$ContactTable, ContactData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jobTitleMeta = const VerificationMeta(
    'jobTitle',
  );
  @override
  late final GeneratedColumn<String> jobTitle = GeneratedColumn<String>(
    'job_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedColumn<String> team = GeneratedColumn<String>(
    'team',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _channelsMeta = const VerificationMeta(
    'channels',
  );
  @override
  late final GeneratedColumn<String> channels = GeneratedColumn<String>(
    'channels',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areasMeta = const VerificationMeta('areas');
  @override
  late final GeneratedColumn<String> areas = GeneratedColumn<String>(
    'areas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extensionMeta = const VerificationMeta(
    'extension',
  );
  @override
  late final GeneratedColumn<String> extension = GeneratedColumn<String>(
    'extension',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesEncryptedMeta = const VerificationMeta(
    'notesEncrypted',
  );
  @override
  late final GeneratedColumn<String> notesEncrypted = GeneratedColumn<String>(
    'notes_encrypted',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _favoriteMeta = const VerificationMeta(
    'favorite',
  );
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
    'favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _linkedStaffIdMeta = const VerificationMeta(
    'linkedStaffId',
  );
  @override
  late final GeneratedColumn<int> linkedStaffId = GeneratedColumn<int>(
    'linked_staff_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES staff (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    jobTitle,
    team,
    channels,
    areas,
    extension,
    email,
    notesEncrypted,
    favorite,
    linkedStaffId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contact';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContactData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('job_title')) {
      context.handle(
        _jobTitleMeta,
        jobTitle.isAcceptableOrUnknown(data['job_title']!, _jobTitleMeta),
      );
    }
    if (data.containsKey('team')) {
      context.handle(
        _teamMeta,
        team.isAcceptableOrUnknown(data['team']!, _teamMeta),
      );
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    if (data.containsKey('channels')) {
      context.handle(
        _channelsMeta,
        channels.isAcceptableOrUnknown(data['channels']!, _channelsMeta),
      );
    }
    if (data.containsKey('areas')) {
      context.handle(
        _areasMeta,
        areas.isAcceptableOrUnknown(data['areas']!, _areasMeta),
      );
    }
    if (data.containsKey('extension')) {
      context.handle(
        _extensionMeta,
        extension.isAcceptableOrUnknown(data['extension']!, _extensionMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('notes_encrypted')) {
      context.handle(
        _notesEncryptedMeta,
        notesEncrypted.isAcceptableOrUnknown(
          data['notes_encrypted']!,
          _notesEncryptedMeta,
        ),
      );
    }
    if (data.containsKey('favorite')) {
      context.handle(
        _favoriteMeta,
        favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta),
      );
    }
    if (data.containsKey('linked_staff_id')) {
      context.handle(
        _linkedStaffIdMeta,
        linkedStaffId.isAcceptableOrUnknown(
          data['linked_staff_id']!,
          _linkedStaffIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContactData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      jobTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}job_title'],
      ),
      team: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}team'],
      )!,
      channels: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channels'],
      ),
      areas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}areas'],
      ),
      extension: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extension'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      notesEncrypted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes_encrypted'],
      ),
      favorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favorite'],
      )!,
      linkedStaffId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}linked_staff_id'],
      ),
    );
  }

  @override
  $ContactTable createAlias(String alias) {
    return $ContactTable(attachedDatabase, alias);
  }
}

class ContactData extends DataClass implements Insertable<ContactData> {
  final int id;
  final String name;
  final String? jobTitle;
  final String team;
  final String? channels;
  final String? areas;
  final String? extension;
  final String? email;
  final String? notesEncrypted;
  final bool favorite;
  final int? linkedStaffId;
  const ContactData({
    required this.id,
    required this.name,
    this.jobTitle,
    required this.team,
    this.channels,
    this.areas,
    this.extension,
    this.email,
    this.notesEncrypted,
    required this.favorite,
    this.linkedStaffId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || jobTitle != null) {
      map['job_title'] = Variable<String>(jobTitle);
    }
    map['team'] = Variable<String>(team);
    if (!nullToAbsent || channels != null) {
      map['channels'] = Variable<String>(channels);
    }
    if (!nullToAbsent || areas != null) {
      map['areas'] = Variable<String>(areas);
    }
    if (!nullToAbsent || extension != null) {
      map['extension'] = Variable<String>(extension);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || notesEncrypted != null) {
      map['notes_encrypted'] = Variable<String>(notesEncrypted);
    }
    map['favorite'] = Variable<bool>(favorite);
    if (!nullToAbsent || linkedStaffId != null) {
      map['linked_staff_id'] = Variable<int>(linkedStaffId);
    }
    return map;
  }

  ContactCompanion toCompanion(bool nullToAbsent) {
    return ContactCompanion(
      id: Value(id),
      name: Value(name),
      jobTitle: jobTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(jobTitle),
      team: Value(team),
      channels: channels == null && nullToAbsent
          ? const Value.absent()
          : Value(channels),
      areas: areas == null && nullToAbsent
          ? const Value.absent()
          : Value(areas),
      extension: extension == null && nullToAbsent
          ? const Value.absent()
          : Value(extension),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      notesEncrypted: notesEncrypted == null && nullToAbsent
          ? const Value.absent()
          : Value(notesEncrypted),
      favorite: Value(favorite),
      linkedStaffId: linkedStaffId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedStaffId),
    );
  }

  factory ContactData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      jobTitle: serializer.fromJson<String?>(json['jobTitle']),
      team: serializer.fromJson<String>(json['team']),
      channels: serializer.fromJson<String?>(json['channels']),
      areas: serializer.fromJson<String?>(json['areas']),
      extension: serializer.fromJson<String?>(json['extension']),
      email: serializer.fromJson<String?>(json['email']),
      notesEncrypted: serializer.fromJson<String?>(json['notesEncrypted']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      linkedStaffId: serializer.fromJson<int?>(json['linkedStaffId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'jobTitle': serializer.toJson<String?>(jobTitle),
      'team': serializer.toJson<String>(team),
      'channels': serializer.toJson<String?>(channels),
      'areas': serializer.toJson<String?>(areas),
      'extension': serializer.toJson<String?>(extension),
      'email': serializer.toJson<String?>(email),
      'notesEncrypted': serializer.toJson<String?>(notesEncrypted),
      'favorite': serializer.toJson<bool>(favorite),
      'linkedStaffId': serializer.toJson<int?>(linkedStaffId),
    };
  }

  ContactData copyWith({
    int? id,
    String? name,
    Value<String?> jobTitle = const Value.absent(),
    String? team,
    Value<String?> channels = const Value.absent(),
    Value<String?> areas = const Value.absent(),
    Value<String?> extension = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> notesEncrypted = const Value.absent(),
    bool? favorite,
    Value<int?> linkedStaffId = const Value.absent(),
  }) => ContactData(
    id: id ?? this.id,
    name: name ?? this.name,
    jobTitle: jobTitle.present ? jobTitle.value : this.jobTitle,
    team: team ?? this.team,
    channels: channels.present ? channels.value : this.channels,
    areas: areas.present ? areas.value : this.areas,
    extension: extension.present ? extension.value : this.extension,
    email: email.present ? email.value : this.email,
    notesEncrypted: notesEncrypted.present
        ? notesEncrypted.value
        : this.notesEncrypted,
    favorite: favorite ?? this.favorite,
    linkedStaffId: linkedStaffId.present
        ? linkedStaffId.value
        : this.linkedStaffId,
  );
  ContactData copyWithCompanion(ContactCompanion data) {
    return ContactData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      jobTitle: data.jobTitle.present ? data.jobTitle.value : this.jobTitle,
      team: data.team.present ? data.team.value : this.team,
      channels: data.channels.present ? data.channels.value : this.channels,
      areas: data.areas.present ? data.areas.value : this.areas,
      extension: data.extension.present ? data.extension.value : this.extension,
      email: data.email.present ? data.email.value : this.email,
      notesEncrypted: data.notesEncrypted.present
          ? data.notesEncrypted.value
          : this.notesEncrypted,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      linkedStaffId: data.linkedStaffId.present
          ? data.linkedStaffId.value
          : this.linkedStaffId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContactData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('team: $team, ')
          ..write('channels: $channels, ')
          ..write('areas: $areas, ')
          ..write('extension: $extension, ')
          ..write('email: $email, ')
          ..write('notesEncrypted: $notesEncrypted, ')
          ..write('favorite: $favorite, ')
          ..write('linkedStaffId: $linkedStaffId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    jobTitle,
    team,
    channels,
    areas,
    extension,
    email,
    notesEncrypted,
    favorite,
    linkedStaffId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactData &&
          other.id == this.id &&
          other.name == this.name &&
          other.jobTitle == this.jobTitle &&
          other.team == this.team &&
          other.channels == this.channels &&
          other.areas == this.areas &&
          other.extension == this.extension &&
          other.email == this.email &&
          other.notesEncrypted == this.notesEncrypted &&
          other.favorite == this.favorite &&
          other.linkedStaffId == this.linkedStaffId);
}

class ContactCompanion extends UpdateCompanion<ContactData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> jobTitle;
  final Value<String> team;
  final Value<String?> channels;
  final Value<String?> areas;
  final Value<String?> extension;
  final Value<String?> email;
  final Value<String?> notesEncrypted;
  final Value<bool> favorite;
  final Value<int?> linkedStaffId;
  const ContactCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.team = const Value.absent(),
    this.channels = const Value.absent(),
    this.areas = const Value.absent(),
    this.extension = const Value.absent(),
    this.email = const Value.absent(),
    this.notesEncrypted = const Value.absent(),
    this.favorite = const Value.absent(),
    this.linkedStaffId = const Value.absent(),
  });
  ContactCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.jobTitle = const Value.absent(),
    required String team,
    this.channels = const Value.absent(),
    this.areas = const Value.absent(),
    this.extension = const Value.absent(),
    this.email = const Value.absent(),
    this.notesEncrypted = const Value.absent(),
    this.favorite = const Value.absent(),
    this.linkedStaffId = const Value.absent(),
  }) : name = Value(name),
       team = Value(team);
  static Insertable<ContactData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? jobTitle,
    Expression<String>? team,
    Expression<String>? channels,
    Expression<String>? areas,
    Expression<String>? extension,
    Expression<String>? email,
    Expression<String>? notesEncrypted,
    Expression<bool>? favorite,
    Expression<int>? linkedStaffId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (jobTitle != null) 'job_title': jobTitle,
      if (team != null) 'team': team,
      if (channels != null) 'channels': channels,
      if (areas != null) 'areas': areas,
      if (extension != null) 'extension': extension,
      if (email != null) 'email': email,
      if (notesEncrypted != null) 'notes_encrypted': notesEncrypted,
      if (favorite != null) 'favorite': favorite,
      if (linkedStaffId != null) 'linked_staff_id': linkedStaffId,
    });
  }

  ContactCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? jobTitle,
    Value<String>? team,
    Value<String?>? channels,
    Value<String?>? areas,
    Value<String?>? extension,
    Value<String?>? email,
    Value<String?>? notesEncrypted,
    Value<bool>? favorite,
    Value<int?>? linkedStaffId,
  }) {
    return ContactCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      jobTitle: jobTitle ?? this.jobTitle,
      team: team ?? this.team,
      channels: channels ?? this.channels,
      areas: areas ?? this.areas,
      extension: extension ?? this.extension,
      email: email ?? this.email,
      notesEncrypted: notesEncrypted ?? this.notesEncrypted,
      favorite: favorite ?? this.favorite,
      linkedStaffId: linkedStaffId ?? this.linkedStaffId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (jobTitle.present) {
      map['job_title'] = Variable<String>(jobTitle.value);
    }
    if (team.present) {
      map['team'] = Variable<String>(team.value);
    }
    if (channels.present) {
      map['channels'] = Variable<String>(channels.value);
    }
    if (areas.present) {
      map['areas'] = Variable<String>(areas.value);
    }
    if (extension.present) {
      map['extension'] = Variable<String>(extension.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (notesEncrypted.present) {
      map['notes_encrypted'] = Variable<String>(notesEncrypted.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (linkedStaffId.present) {
      map['linked_staff_id'] = Variable<int>(linkedStaffId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('team: $team, ')
          ..write('channels: $channels, ')
          ..write('areas: $areas, ')
          ..write('extension: $extension, ')
          ..write('email: $email, ')
          ..write('notesEncrypted: $notesEncrypted, ')
          ..write('favorite: $favorite, ')
          ..write('linkedStaffId: $linkedStaffId')
          ..write(')'))
        .toString();
  }
}

class $BlacklistEntryTable extends BlacklistEntry
    with TableInfo<$BlacklistEntryTable, BlacklistEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlacklistEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aliasesMeta = const VerificationMeta(
    'aliases',
  );
  @override
  late final GeneratedColumn<String> aliases = GeneratedColumn<String>(
    'aliases',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _programsMeta = const VerificationMeta(
    'programs',
  );
  @override
  late final GeneratedColumn<String> programs = GeneratedColumn<String>(
    'programs',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonEncryptedMeta = const VerificationMeta(
    'reasonEncrypted',
  );
  @override
  late final GeneratedColumn<String> reasonEncrypted = GeneratedColumn<String>(
    'reason_encrypted',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceEncryptedMeta = const VerificationMeta(
    'sourceEncrypted',
  );
  @override
  late final GeneratedColumn<String> sourceEncrypted = GeneratedColumn<String>(
    'source_encrypted',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastReviewedMeta = const VerificationMeta(
    'lastReviewed',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewed = GeneratedColumn<DateTime>(
    'last_reviewed',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reviewOwnerMeta = const VerificationMeta(
    'reviewOwner',
  );
  @override
  late final GeneratedColumn<String> reviewOwner = GeneratedColumn<String>(
    'review_owner',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesEncryptedMeta = const VerificationMeta(
    'notesEncrypted',
  );
  @override
  late final GeneratedColumn<String> notesEncrypted = GeneratedColumn<String>(
    'notes_encrypted',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    aliases,
    programs,
    status,
    reasonEncrypted,
    sourceEncrypted,
    dateAdded,
    lastReviewed,
    reviewOwner,
    notesEncrypted,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blacklist_entry';
  @override
  VerificationContext validateIntegrity(
    Insertable<BlacklistEntryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('aliases')) {
      context.handle(
        _aliasesMeta,
        aliases.isAcceptableOrUnknown(data['aliases']!, _aliasesMeta),
      );
    }
    if (data.containsKey('programs')) {
      context.handle(
        _programsMeta,
        programs.isAcceptableOrUnknown(data['programs']!, _programsMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('reason_encrypted')) {
      context.handle(
        _reasonEncryptedMeta,
        reasonEncrypted.isAcceptableOrUnknown(
          data['reason_encrypted']!,
          _reasonEncryptedMeta,
        ),
      );
    }
    if (data.containsKey('source_encrypted')) {
      context.handle(
        _sourceEncryptedMeta,
        sourceEncrypted.isAcceptableOrUnknown(
          data['source_encrypted']!,
          _sourceEncryptedMeta,
        ),
      );
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    } else if (isInserting) {
      context.missing(_dateAddedMeta);
    }
    if (data.containsKey('last_reviewed')) {
      context.handle(
        _lastReviewedMeta,
        lastReviewed.isAcceptableOrUnknown(
          data['last_reviewed']!,
          _lastReviewedMeta,
        ),
      );
    }
    if (data.containsKey('review_owner')) {
      context.handle(
        _reviewOwnerMeta,
        reviewOwner.isAcceptableOrUnknown(
          data['review_owner']!,
          _reviewOwnerMeta,
        ),
      );
    }
    if (data.containsKey('notes_encrypted')) {
      context.handle(
        _notesEncryptedMeta,
        notesEncrypted.isAcceptableOrUnknown(
          data['notes_encrypted']!,
          _notesEncryptedMeta,
        ),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BlacklistEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlacklistEntryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      aliases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aliases'],
      ),
      programs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}programs'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      reasonEncrypted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason_encrypted'],
      ),
      sourceEncrypted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_encrypted'],
      ),
      dateAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_added'],
      )!,
      lastReviewed: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed'],
      ),
      reviewOwner: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}review_owner'],
      ),
      notesEncrypted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes_encrypted'],
      ),
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $BlacklistEntryTable createAlias(String alias) {
    return $BlacklistEntryTable(attachedDatabase, alias);
  }
}

class BlacklistEntryData extends DataClass
    implements Insertable<BlacklistEntryData> {
  final int id;
  final String name;
  final String category;
  final String? aliases;
  final String? programs;
  final String status;
  final String? reasonEncrypted;
  final String? sourceEncrypted;
  final DateTime dateAdded;
  final DateTime? lastReviewed;
  final String? reviewOwner;
  final String? notesEncrypted;
  final bool active;
  const BlacklistEntryData({
    required this.id,
    required this.name,
    required this.category,
    this.aliases,
    this.programs,
    required this.status,
    this.reasonEncrypted,
    this.sourceEncrypted,
    required this.dateAdded,
    this.lastReviewed,
    this.reviewOwner,
    this.notesEncrypted,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || aliases != null) {
      map['aliases'] = Variable<String>(aliases);
    }
    if (!nullToAbsent || programs != null) {
      map['programs'] = Variable<String>(programs);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || reasonEncrypted != null) {
      map['reason_encrypted'] = Variable<String>(reasonEncrypted);
    }
    if (!nullToAbsent || sourceEncrypted != null) {
      map['source_encrypted'] = Variable<String>(sourceEncrypted);
    }
    map['date_added'] = Variable<DateTime>(dateAdded);
    if (!nullToAbsent || lastReviewed != null) {
      map['last_reviewed'] = Variable<DateTime>(lastReviewed);
    }
    if (!nullToAbsent || reviewOwner != null) {
      map['review_owner'] = Variable<String>(reviewOwner);
    }
    if (!nullToAbsent || notesEncrypted != null) {
      map['notes_encrypted'] = Variable<String>(notesEncrypted);
    }
    map['active'] = Variable<bool>(active);
    return map;
  }

  BlacklistEntryCompanion toCompanion(bool nullToAbsent) {
    return BlacklistEntryCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      aliases: aliases == null && nullToAbsent
          ? const Value.absent()
          : Value(aliases),
      programs: programs == null && nullToAbsent
          ? const Value.absent()
          : Value(programs),
      status: Value(status),
      reasonEncrypted: reasonEncrypted == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonEncrypted),
      sourceEncrypted: sourceEncrypted == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceEncrypted),
      dateAdded: Value(dateAdded),
      lastReviewed: lastReviewed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewed),
      reviewOwner: reviewOwner == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewOwner),
      notesEncrypted: notesEncrypted == null && nullToAbsent
          ? const Value.absent()
          : Value(notesEncrypted),
      active: Value(active),
    );
  }

  factory BlacklistEntryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlacklistEntryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      aliases: serializer.fromJson<String?>(json['aliases']),
      programs: serializer.fromJson<String?>(json['programs']),
      status: serializer.fromJson<String>(json['status']),
      reasonEncrypted: serializer.fromJson<String?>(json['reasonEncrypted']),
      sourceEncrypted: serializer.fromJson<String?>(json['sourceEncrypted']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      lastReviewed: serializer.fromJson<DateTime?>(json['lastReviewed']),
      reviewOwner: serializer.fromJson<String?>(json['reviewOwner']),
      notesEncrypted: serializer.fromJson<String?>(json['notesEncrypted']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'aliases': serializer.toJson<String?>(aliases),
      'programs': serializer.toJson<String?>(programs),
      'status': serializer.toJson<String>(status),
      'reasonEncrypted': serializer.toJson<String?>(reasonEncrypted),
      'sourceEncrypted': serializer.toJson<String?>(sourceEncrypted),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'lastReviewed': serializer.toJson<DateTime?>(lastReviewed),
      'reviewOwner': serializer.toJson<String?>(reviewOwner),
      'notesEncrypted': serializer.toJson<String?>(notesEncrypted),
      'active': serializer.toJson<bool>(active),
    };
  }

  BlacklistEntryData copyWith({
    int? id,
    String? name,
    String? category,
    Value<String?> aliases = const Value.absent(),
    Value<String?> programs = const Value.absent(),
    String? status,
    Value<String?> reasonEncrypted = const Value.absent(),
    Value<String?> sourceEncrypted = const Value.absent(),
    DateTime? dateAdded,
    Value<DateTime?> lastReviewed = const Value.absent(),
    Value<String?> reviewOwner = const Value.absent(),
    Value<String?> notesEncrypted = const Value.absent(),
    bool? active,
  }) => BlacklistEntryData(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    aliases: aliases.present ? aliases.value : this.aliases,
    programs: programs.present ? programs.value : this.programs,
    status: status ?? this.status,
    reasonEncrypted: reasonEncrypted.present
        ? reasonEncrypted.value
        : this.reasonEncrypted,
    sourceEncrypted: sourceEncrypted.present
        ? sourceEncrypted.value
        : this.sourceEncrypted,
    dateAdded: dateAdded ?? this.dateAdded,
    lastReviewed: lastReviewed.present ? lastReviewed.value : this.lastReviewed,
    reviewOwner: reviewOwner.present ? reviewOwner.value : this.reviewOwner,
    notesEncrypted: notesEncrypted.present
        ? notesEncrypted.value
        : this.notesEncrypted,
    active: active ?? this.active,
  );
  BlacklistEntryData copyWithCompanion(BlacklistEntryCompanion data) {
    return BlacklistEntryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      programs: data.programs.present ? data.programs.value : this.programs,
      status: data.status.present ? data.status.value : this.status,
      reasonEncrypted: data.reasonEncrypted.present
          ? data.reasonEncrypted.value
          : this.reasonEncrypted,
      sourceEncrypted: data.sourceEncrypted.present
          ? data.sourceEncrypted.value
          : this.sourceEncrypted,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
      lastReviewed: data.lastReviewed.present
          ? data.lastReviewed.value
          : this.lastReviewed,
      reviewOwner: data.reviewOwner.present
          ? data.reviewOwner.value
          : this.reviewOwner,
      notesEncrypted: data.notesEncrypted.present
          ? data.notesEncrypted.value
          : this.notesEncrypted,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlacklistEntryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('aliases: $aliases, ')
          ..write('programs: $programs, ')
          ..write('status: $status, ')
          ..write('reasonEncrypted: $reasonEncrypted, ')
          ..write('sourceEncrypted: $sourceEncrypted, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('lastReviewed: $lastReviewed, ')
          ..write('reviewOwner: $reviewOwner, ')
          ..write('notesEncrypted: $notesEncrypted, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    aliases,
    programs,
    status,
    reasonEncrypted,
    sourceEncrypted,
    dateAdded,
    lastReviewed,
    reviewOwner,
    notesEncrypted,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlacklistEntryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.aliases == this.aliases &&
          other.programs == this.programs &&
          other.status == this.status &&
          other.reasonEncrypted == this.reasonEncrypted &&
          other.sourceEncrypted == this.sourceEncrypted &&
          other.dateAdded == this.dateAdded &&
          other.lastReviewed == this.lastReviewed &&
          other.reviewOwner == this.reviewOwner &&
          other.notesEncrypted == this.notesEncrypted &&
          other.active == this.active);
}

class BlacklistEntryCompanion extends UpdateCompanion<BlacklistEntryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String?> aliases;
  final Value<String?> programs;
  final Value<String> status;
  final Value<String?> reasonEncrypted;
  final Value<String?> sourceEncrypted;
  final Value<DateTime> dateAdded;
  final Value<DateTime?> lastReviewed;
  final Value<String?> reviewOwner;
  final Value<String?> notesEncrypted;
  final Value<bool> active;
  const BlacklistEntryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.aliases = const Value.absent(),
    this.programs = const Value.absent(),
    this.status = const Value.absent(),
    this.reasonEncrypted = const Value.absent(),
    this.sourceEncrypted = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.lastReviewed = const Value.absent(),
    this.reviewOwner = const Value.absent(),
    this.notesEncrypted = const Value.absent(),
    this.active = const Value.absent(),
  });
  BlacklistEntryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    this.aliases = const Value.absent(),
    this.programs = const Value.absent(),
    required String status,
    this.reasonEncrypted = const Value.absent(),
    this.sourceEncrypted = const Value.absent(),
    required DateTime dateAdded,
    this.lastReviewed = const Value.absent(),
    this.reviewOwner = const Value.absent(),
    this.notesEncrypted = const Value.absent(),
    this.active = const Value.absent(),
  }) : name = Value(name),
       category = Value(category),
       status = Value(status),
       dateAdded = Value(dateAdded);
  static Insertable<BlacklistEntryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? aliases,
    Expression<String>? programs,
    Expression<String>? status,
    Expression<String>? reasonEncrypted,
    Expression<String>? sourceEncrypted,
    Expression<DateTime>? dateAdded,
    Expression<DateTime>? lastReviewed,
    Expression<String>? reviewOwner,
    Expression<String>? notesEncrypted,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (aliases != null) 'aliases': aliases,
      if (programs != null) 'programs': programs,
      if (status != null) 'status': status,
      if (reasonEncrypted != null) 'reason_encrypted': reasonEncrypted,
      if (sourceEncrypted != null) 'source_encrypted': sourceEncrypted,
      if (dateAdded != null) 'date_added': dateAdded,
      if (lastReviewed != null) 'last_reviewed': lastReviewed,
      if (reviewOwner != null) 'review_owner': reviewOwner,
      if (notesEncrypted != null) 'notes_encrypted': notesEncrypted,
      if (active != null) 'active': active,
    });
  }

  BlacklistEntryCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String?>? aliases,
    Value<String?>? programs,
    Value<String>? status,
    Value<String?>? reasonEncrypted,
    Value<String?>? sourceEncrypted,
    Value<DateTime>? dateAdded,
    Value<DateTime?>? lastReviewed,
    Value<String?>? reviewOwner,
    Value<String?>? notesEncrypted,
    Value<bool>? active,
  }) {
    return BlacklistEntryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      aliases: aliases ?? this.aliases,
      programs: programs ?? this.programs,
      status: status ?? this.status,
      reasonEncrypted: reasonEncrypted ?? this.reasonEncrypted,
      sourceEncrypted: sourceEncrypted ?? this.sourceEncrypted,
      dateAdded: dateAdded ?? this.dateAdded,
      lastReviewed: lastReviewed ?? this.lastReviewed,
      reviewOwner: reviewOwner ?? this.reviewOwner,
      notesEncrypted: notesEncrypted ?? this.notesEncrypted,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (programs.present) {
      map['programs'] = Variable<String>(programs.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (reasonEncrypted.present) {
      map['reason_encrypted'] = Variable<String>(reasonEncrypted.value);
    }
    if (sourceEncrypted.present) {
      map['source_encrypted'] = Variable<String>(sourceEncrypted.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (lastReviewed.present) {
      map['last_reviewed'] = Variable<DateTime>(lastReviewed.value);
    }
    if (reviewOwner.present) {
      map['review_owner'] = Variable<String>(reviewOwner.value);
    }
    if (notesEncrypted.present) {
      map['notes_encrypted'] = Variable<String>(notesEncrypted.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlacklistEntryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('aliases: $aliases, ')
          ..write('programs: $programs, ')
          ..write('status: $status, ')
          ..write('reasonEncrypted: $reasonEncrypted, ')
          ..write('sourceEncrypted: $sourceEncrypted, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('lastReviewed: $lastReviewed, ')
          ..write('reviewOwner: $reviewOwner, ')
          ..write('notesEncrypted: $notesEncrypted, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $AuditLogEntryTable extends AuditLogEntry
    with TableInfo<$AuditLogEntryTable, AuditLogEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _actorMeta = const VerificationMeta('actor');
  @override
  late final GeneratedColumn<String> actor = GeneratedColumn<String>(
    'actor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    actor,
    action,
    entity,
    entityId,
    timestamp,
    details,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_log_entry';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLogEntryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('actor')) {
      context.handle(
        _actorMeta,
        actor.isAcceptableOrUnknown(data['actor']!, _actorMeta),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogEntryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      actor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actor'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      ),
    );
  }

  @override
  $AuditLogEntryTable createAlias(String alias) {
    return $AuditLogEntryTable(attachedDatabase, alias);
  }
}

class AuditLogEntryData extends DataClass
    implements Insertable<AuditLogEntryData> {
  final int id;
  final String? actor;
  final String action;
  final String entity;
  final int? entityId;
  final DateTime timestamp;
  final String? details;
  const AuditLogEntryData({
    required this.id,
    this.actor,
    required this.action,
    required this.entity,
    this.entityId,
    required this.timestamp,
    this.details,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || actor != null) {
      map['actor'] = Variable<String>(actor);
    }
    map['action'] = Variable<String>(action);
    map['entity'] = Variable<String>(entity);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<int>(entityId);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    return map;
  }

  AuditLogEntryCompanion toCompanion(bool nullToAbsent) {
    return AuditLogEntryCompanion(
      id: Value(id),
      actor: actor == null && nullToAbsent
          ? const Value.absent()
          : Value(actor),
      action: Value(action),
      entity: Value(entity),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      timestamp: Value(timestamp),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
    );
  }

  factory AuditLogEntryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogEntryData(
      id: serializer.fromJson<int>(json['id']),
      actor: serializer.fromJson<String?>(json['actor']),
      action: serializer.fromJson<String>(json['action']),
      entity: serializer.fromJson<String>(json['entity']),
      entityId: serializer.fromJson<int?>(json['entityId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      details: serializer.fromJson<String?>(json['details']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'actor': serializer.toJson<String?>(actor),
      'action': serializer.toJson<String>(action),
      'entity': serializer.toJson<String>(entity),
      'entityId': serializer.toJson<int?>(entityId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'details': serializer.toJson<String?>(details),
    };
  }

  AuditLogEntryData copyWith({
    int? id,
    Value<String?> actor = const Value.absent(),
    String? action,
    String? entity,
    Value<int?> entityId = const Value.absent(),
    DateTime? timestamp,
    Value<String?> details = const Value.absent(),
  }) => AuditLogEntryData(
    id: id ?? this.id,
    actor: actor.present ? actor.value : this.actor,
    action: action ?? this.action,
    entity: entity ?? this.entity,
    entityId: entityId.present ? entityId.value : this.entityId,
    timestamp: timestamp ?? this.timestamp,
    details: details.present ? details.value : this.details,
  );
  AuditLogEntryData copyWithCompanion(AuditLogEntryCompanion data) {
    return AuditLogEntryData(
      id: data.id.present ? data.id.value : this.id,
      actor: data.actor.present ? data.actor.value : this.actor,
      action: data.action.present ? data.action.value : this.action,
      entity: data.entity.present ? data.entity.value : this.entity,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      details: data.details.present ? data.details.value : this.details,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogEntryData(')
          ..write('id: $id, ')
          ..write('actor: $actor, ')
          ..write('action: $action, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('timestamp: $timestamp, ')
          ..write('details: $details')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, actor, action, entity, entityId, timestamp, details);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogEntryData &&
          other.id == this.id &&
          other.actor == this.actor &&
          other.action == this.action &&
          other.entity == this.entity &&
          other.entityId == this.entityId &&
          other.timestamp == this.timestamp &&
          other.details == this.details);
}

class AuditLogEntryCompanion extends UpdateCompanion<AuditLogEntryData> {
  final Value<int> id;
  final Value<String?> actor;
  final Value<String> action;
  final Value<String> entity;
  final Value<int?> entityId;
  final Value<DateTime> timestamp;
  final Value<String?> details;
  const AuditLogEntryCompanion({
    this.id = const Value.absent(),
    this.actor = const Value.absent(),
    this.action = const Value.absent(),
    this.entity = const Value.absent(),
    this.entityId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.details = const Value.absent(),
  });
  AuditLogEntryCompanion.insert({
    this.id = const Value.absent(),
    this.actor = const Value.absent(),
    required String action,
    required String entity,
    this.entityId = const Value.absent(),
    required DateTime timestamp,
    this.details = const Value.absent(),
  }) : action = Value(action),
       entity = Value(entity),
       timestamp = Value(timestamp);
  static Insertable<AuditLogEntryData> custom({
    Expression<int>? id,
    Expression<String>? actor,
    Expression<String>? action,
    Expression<String>? entity,
    Expression<int>? entityId,
    Expression<DateTime>? timestamp,
    Expression<String>? details,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actor != null) 'actor': actor,
      if (action != null) 'action': action,
      if (entity != null) 'entity': entity,
      if (entityId != null) 'entity_id': entityId,
      if (timestamp != null) 'timestamp': timestamp,
      if (details != null) 'details': details,
    });
  }

  AuditLogEntryCompanion copyWith({
    Value<int>? id,
    Value<String?>? actor,
    Value<String>? action,
    Value<String>? entity,
    Value<int?>? entityId,
    Value<DateTime>? timestamp,
    Value<String?>? details,
  }) {
    return AuditLogEntryCompanion(
      id: id ?? this.id,
      actor: actor ?? this.actor,
      action: action ?? this.action,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      timestamp: timestamp ?? this.timestamp,
      details: details ?? this.details,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (actor.present) {
      map['actor'] = Variable<String>(actor.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogEntryCompanion(')
          ..write('id: $id, ')
          ..write('actor: $actor, ')
          ..write('action: $action, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('timestamp: $timestamp, ')
          ..write('details: $details')
          ..write(')'))
        .toString();
  }
}

class $AppSettingTable extends AppSetting
    with TableInfo<$AppSettingTable, AppSettingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_setting';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSettingData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSettingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
    );
  }

  @override
  $AppSettingTable createAlias(String alias) {
    return $AppSettingTable(attachedDatabase, alias);
  }
}

class AppSettingData extends DataClass implements Insertable<AppSettingData> {
  final String key;
  final String? value;
  const AppSettingData({required this.key, this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  AppSettingCompanion toCompanion(bool nullToAbsent) {
    return AppSettingCompanion(
      key: Value(key),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
    );
  }

  factory AppSettingData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String?>(value),
    };
  }

  AppSettingData copyWith({
    String? key,
    Value<String?> value = const Value.absent(),
  }) => AppSettingData(
    key: key ?? this.key,
    value: value.present ? value.value : this.value,
  );
  AppSettingData copyWithCompanion(AppSettingCompanion data) {
    return AppSettingData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingData &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingCompanion extends UpdateCompanion<AppSettingData> {
  final Value<String> key;
  final Value<String?> value;
  final Value<int> rowid;
  const AppSettingCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingCompanion.insert({
    required String key,
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<AppSettingData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingCompanion copyWith({
    Value<String>? key,
    Value<String?>? value,
    Value<int>? rowid,
  }) {
    return AppSettingCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StaffTable staff = $StaffTable(this);
  late final $ImportRecordTable importRecord = $ImportRecordTable(this);
  late final $RotaAssignmentTable rotaAssignment = $RotaAssignmentTable(this);
  late final $DutyAssignmentTable dutyAssignment = $DutyAssignmentTable(this);
  late final $ShiftCodeTable shiftCode = $ShiftCodeTable(this);
  late final $ManualCategoryTable manualCategory = $ManualCategoryTable(this);
  late final $ManualDocumentTable manualDocument = $ManualDocumentTable(this);
  late final $SegContentCategoryRowTable segContentCategoryRow =
      $SegContentCategoryRowTable(this);
  late final $SegSpecialFileGroupRowTable segSpecialFileGroupRow =
      $SegSpecialFileGroupRowTable(this);
  late final $SegGlossaryRowTable segGlossaryRow = $SegGlossaryRowTable(this);
  late final $ContactTable contact = $ContactTable(this);
  late final $BlacklistEntryTable blacklistEntry = $BlacklistEntryTable(this);
  late final $AuditLogEntryTable auditLogEntry = $AuditLogEntryTable(this);
  late final $AppSettingTable appSetting = $AppSettingTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    staff,
    importRecord,
    rotaAssignment,
    dutyAssignment,
    shiftCode,
    manualCategory,
    manualDocument,
    segContentCategoryRow,
    segSpecialFileGroupRow,
    segGlossaryRow,
    contact,
    blacklistEntry,
    auditLogEntry,
    appSetting,
  ];
}

typedef $$StaffTableCreateCompanionBuilder = StaffCompanion Function({
  Value<int> id,
  required String fullName,
  required String initials,
  Value<String?> jobTitle,
  Value<String> homeSection,
  Value<String?> defaultShiftCode,
  Value<String?> suiteOrBay,
  Value<String?> extension,
  Value<String?> email,
  Value<String?> skills,
  Value<String?> languages,
  Value<bool> inChargeEligible,
  Value<bool> qc2Eligible,
  Value<bool> active,
});
typedef $$StaffTableUpdateCompanionBuilder = StaffCompanion Function({
  Value<int> id,
  Value<String> fullName,
  Value<String> initials,
  Value<String?> jobTitle,
  Value<String> homeSection,
  Value<String?> defaultShiftCode,
  Value<String?> suiteOrBay,
  Value<String?> extension,
  Value<String?> email,
  Value<String?> skills,
  Value<String?> languages,
  Value<bool> inChargeEligible,
  Value<bool> qc2Eligible,
  Value<bool> active,
});

final class $$StaffTableReferences
    extends BaseReferences<_$AppDatabase, $StaffTable, StaffData> {
  $$StaffTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RotaAssignmentTable, List<RotaAssignmentData>>
  _rotaAssignmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rotaAssignment,
    aliasName: 'staff__id__rota_assignment__staff_id',
  );

  $$RotaAssignmentTableProcessedTableManager get rotaAssignmentRefs {
    final manager = $$RotaAssignmentTableTableManager(
      $_db,
      $_db.rotaAssignment,
    ).filter((f) => f.staffId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rotaAssignmentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ContactTable, List<ContactData>>
  _contactRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contact,
    aliasName: 'staff__id__contact__linked_staff_id',
  );

  $$ContactTableProcessedTableManager get contactRefs {
    final manager = $$ContactTableTableManager(
      $_db,
      $_db.contact,
    ).filter((f) => f.linkedStaffId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contactRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StaffTableFilterComposer extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get initials => $composableBuilder(
    column: $table.initials,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobTitle => $composableBuilder(
    column: $table.jobTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeSection => $composableBuilder(
    column: $table.homeSection,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultShiftCode => $composableBuilder(
    column: $table.defaultShiftCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get suiteOrBay => $composableBuilder(
    column: $table.suiteOrBay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get skills => $composableBuilder(
    column: $table.skills,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get inChargeEligible => $composableBuilder(
    column: $table.inChargeEligible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get qc2Eligible => $composableBuilder(
    column: $table.qc2Eligible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> rotaAssignmentRefs(
    Expression<bool> Function($$RotaAssignmentTableFilterComposer f) f,
  ) {
    final $$RotaAssignmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rotaAssignment,
      getReferencedColumn: (t) => t.staffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RotaAssignmentTableFilterComposer(
            $db: $db,
            $table: $db.rotaAssignment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> contactRefs(
    Expression<bool> Function($$ContactTableFilterComposer f) f,
  ) {
    final $$ContactTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contact,
      getReferencedColumn: (t) => t.linkedStaffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactTableFilterComposer(
            $db: $db,
            $table: $db.contact,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StaffTableOrderingComposer
    extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get initials => $composableBuilder(
    column: $table.initials,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobTitle => $composableBuilder(
    column: $table.jobTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeSection => $composableBuilder(
    column: $table.homeSection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultShiftCode => $composableBuilder(
    column: $table.defaultShiftCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get suiteOrBay => $composableBuilder(
    column: $table.suiteOrBay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get skills => $composableBuilder(
    column: $table.skills,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get inChargeEligible => $composableBuilder(
    column: $table.inChargeEligible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get qc2Eligible => $composableBuilder(
    column: $table.qc2Eligible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StaffTableAnnotationComposer
    extends Composer<_$AppDatabase, $StaffTable> {
  $$StaffTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get initials =>
      $composableBuilder(column: $table.initials, builder: (column) => column);

  GeneratedColumn<String> get jobTitle =>
      $composableBuilder(column: $table.jobTitle, builder: (column) => column);

  GeneratedColumn<String> get homeSection => $composableBuilder(
    column: $table.homeSection,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultShiftCode => $composableBuilder(
    column: $table.defaultShiftCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get suiteOrBay => $composableBuilder(
    column: $table.suiteOrBay,
    builder: (column) => column,
  );

  GeneratedColumn<String> get extension =>
      $composableBuilder(column: $table.extension, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get skills =>
      $composableBuilder(column: $table.skills, builder: (column) => column);

  GeneratedColumn<String> get languages =>
      $composableBuilder(column: $table.languages, builder: (column) => column);

  GeneratedColumn<bool> get inChargeEligible => $composableBuilder(
    column: $table.inChargeEligible,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get qc2Eligible => $composableBuilder(
    column: $table.qc2Eligible,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  Expression<T> rotaAssignmentRefs<T extends Object>(
    Expression<T> Function($$RotaAssignmentTableAnnotationComposer a) f,
  ) {
    final $$RotaAssignmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rotaAssignment,
      getReferencedColumn: (t) => t.staffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RotaAssignmentTableAnnotationComposer(
            $db: $db,
            $table: $db.rotaAssignment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> contactRefs<T extends Object>(
    Expression<T> Function($$ContactTableAnnotationComposer a) f,
  ) {
    final $$ContactTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contact,
      getReferencedColumn: (t) => t.linkedStaffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactTableAnnotationComposer(
            $db: $db,
            $table: $db.contact,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StaffTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StaffTable,
          StaffData,
          $$StaffTableFilterComposer,
          $$StaffTableOrderingComposer,
          $$StaffTableAnnotationComposer,
          $$StaffTableCreateCompanionBuilder,
          $$StaffTableUpdateCompanionBuilder,
          (StaffData, $$StaffTableReferences),
          StaffData,
          PrefetchHooks Function({bool rotaAssignmentRefs, bool contactRefs})
        > {
  $$StaffTableTableManager(_$AppDatabase db, $StaffTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StaffTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StaffTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StaffTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> initials = const Value.absent(),
                Value<String?> jobTitle = const Value.absent(),
                Value<String> homeSection = const Value.absent(),
                Value<String?> defaultShiftCode = const Value.absent(),
                Value<String?> suiteOrBay = const Value.absent(),
                Value<String?> extension = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> skills = const Value.absent(),
                Value<String?> languages = const Value.absent(),
                Value<bool> inChargeEligible = const Value.absent(),
                Value<bool> qc2Eligible = const Value.absent(),
                Value<bool> active = const Value.absent(),
              }) => StaffCompanion(
                id: id,
                fullName: fullName,
                initials: initials,
                jobTitle: jobTitle,
                homeSection: homeSection,
                defaultShiftCode: defaultShiftCode,
                suiteOrBay: suiteOrBay,
                extension: extension,
                email: email,
                skills: skills,
                languages: languages,
                inChargeEligible: inChargeEligible,
                qc2Eligible: qc2Eligible,
                active: active,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fullName,
                required String initials,
                Value<String?> jobTitle = const Value.absent(),
                Value<String> homeSection = const Value.absent(),
                Value<String?> defaultShiftCode = const Value.absent(),
                Value<String?> suiteOrBay = const Value.absent(),
                Value<String?> extension = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> skills = const Value.absent(),
                Value<String?> languages = const Value.absent(),
                Value<bool> inChargeEligible = const Value.absent(),
                Value<bool> qc2Eligible = const Value.absent(),
                Value<bool> active = const Value.absent(),
              }) => StaffCompanion.insert(
                id: id,
                fullName: fullName,
                initials: initials,
                jobTitle: jobTitle,
                homeSection: homeSection,
                defaultShiftCode: defaultShiftCode,
                suiteOrBay: suiteOrBay,
                extension: extension,
                email: email,
                skills: skills,
                languages: languages,
                inChargeEligible: inChargeEligible,
                qc2Eligible: qc2Eligible,
                active: active,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StaffTable, StaffData>(table),
                  $$StaffTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({rotaAssignmentRefs = false, contactRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (rotaAssignmentRefs) db.rotaAssignment,
                    if (contactRefs) db.contact,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (rotaAssignmentRefs)
                        await $_getPrefetchedData<
                          StaffData,
                          $StaffTable,
                          RotaAssignmentData
                        >(
                          currentTable: table,
                          referencedTable: $$StaffTableReferences
                              ._rotaAssignmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StaffTableReferences(
                                db,
                                table,
                                p0,
                              ).rotaAssignmentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.staffId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (contactRefs)
                        await $_getPrefetchedData<
                          StaffData,
                          $StaffTable,
                          ContactData
                        >(
                          currentTable: table,
                          referencedTable: $$StaffTableReferences
                              ._contactRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StaffTableReferences(db, table, p0).contactRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.linkedStaffId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StaffTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StaffTable,
      StaffData,
      $$StaffTableFilterComposer,
      $$StaffTableOrderingComposer,
      $$StaffTableAnnotationComposer,
      $$StaffTableCreateCompanionBuilder,
      $$StaffTableUpdateCompanionBuilder,
      (StaffData, $$StaffTableReferences),
      StaffData,
      PrefetchHooks Function({bool rotaAssignmentRefs, bool contactRefs})
    >;
typedef $$ImportRecordTableCreateCompanionBuilder =
    ImportRecordCompanion Function({
      Value<int> id,
      required String fileName,
      Value<String?> importedBy,
      required DateTime importedAt,
      Value<int> recordsProcessed,
      Value<String?> warningsJson,
      required int version,
      Value<bool> rollbackAvailable,
    });
typedef $$ImportRecordTableUpdateCompanionBuilder =
    ImportRecordCompanion Function({
      Value<int> id,
      Value<String> fileName,
      Value<String?> importedBy,
      Value<DateTime> importedAt,
      Value<int> recordsProcessed,
      Value<String?> warningsJson,
      Value<int> version,
      Value<bool> rollbackAvailable,
    });

final class $$ImportRecordTableReferences
    extends
        BaseReferences<_$AppDatabase, $ImportRecordTable, ImportRecordData> {
  $$ImportRecordTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RotaAssignmentTable, List<RotaAssignmentData>>
  _rotaAssignmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rotaAssignment,
    aliasName: 'import_record__id__rota_assignment__source_import_id',
  );

  $$RotaAssignmentTableProcessedTableManager get rotaAssignmentRefs {
    final manager = $$RotaAssignmentTableTableManager(
      $_db,
      $_db.rotaAssignment,
    ).filter((f) => f.sourceImportId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rotaAssignmentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ImportRecordTableFilterComposer
    extends Composer<_$AppDatabase, $ImportRecordTable> {
  $$ImportRecordTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get importedBy => $composableBuilder(
    column: $table.importedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recordsProcessed => $composableBuilder(
    column: $table.recordsProcessed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rollbackAvailable => $composableBuilder(
    column: $table.rollbackAvailable,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> rotaAssignmentRefs(
    Expression<bool> Function($$RotaAssignmentTableFilterComposer f) f,
  ) {
    final $$RotaAssignmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rotaAssignment,
      getReferencedColumn: (t) => t.sourceImportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RotaAssignmentTableFilterComposer(
            $db: $db,
            $table: $db.rotaAssignment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ImportRecordTableOrderingComposer
    extends Composer<_$AppDatabase, $ImportRecordTable> {
  $$ImportRecordTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get importedBy => $composableBuilder(
    column: $table.importedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recordsProcessed => $composableBuilder(
    column: $table.recordsProcessed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rollbackAvailable => $composableBuilder(
    column: $table.rollbackAvailable,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImportRecordTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImportRecordTable> {
  $$ImportRecordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get importedBy => $composableBuilder(
    column: $table.importedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get importedAt => $composableBuilder(
    column: $table.importedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get recordsProcessed => $composableBuilder(
    column: $table.recordsProcessed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get warningsJson => $composableBuilder(
    column: $table.warningsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get rollbackAvailable => $composableBuilder(
    column: $table.rollbackAvailable,
    builder: (column) => column,
  );

  Expression<T> rotaAssignmentRefs<T extends Object>(
    Expression<T> Function($$RotaAssignmentTableAnnotationComposer a) f,
  ) {
    final $$RotaAssignmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rotaAssignment,
      getReferencedColumn: (t) => t.sourceImportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RotaAssignmentTableAnnotationComposer(
            $db: $db,
            $table: $db.rotaAssignment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ImportRecordTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImportRecordTable,
          ImportRecordData,
          $$ImportRecordTableFilterComposer,
          $$ImportRecordTableOrderingComposer,
          $$ImportRecordTableAnnotationComposer,
          $$ImportRecordTableCreateCompanionBuilder,
          $$ImportRecordTableUpdateCompanionBuilder,
          (ImportRecordData, $$ImportRecordTableReferences),
          ImportRecordData,
          PrefetchHooks Function({bool rotaAssignmentRefs})
        > {
  $$ImportRecordTableTableManager(_$AppDatabase db, $ImportRecordTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImportRecordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImportRecordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImportRecordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String?> importedBy = const Value.absent(),
                Value<DateTime> importedAt = const Value.absent(),
                Value<int> recordsProcessed = const Value.absent(),
                Value<String?> warningsJson = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> rollbackAvailable = const Value.absent(),
              }) => ImportRecordCompanion(
                id: id,
                fileName: fileName,
                importedBy: importedBy,
                importedAt: importedAt,
                recordsProcessed: recordsProcessed,
                warningsJson: warningsJson,
                version: version,
                rollbackAvailable: rollbackAvailable,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fileName,
                Value<String?> importedBy = const Value.absent(),
                required DateTime importedAt,
                Value<int> recordsProcessed = const Value.absent(),
                Value<String?> warningsJson = const Value.absent(),
                required int version,
                Value<bool> rollbackAvailable = const Value.absent(),
              }) => ImportRecordCompanion.insert(
                id: id,
                fileName: fileName,
                importedBy: importedBy,
                importedAt: importedAt,
                recordsProcessed: recordsProcessed,
                warningsJson: warningsJson,
                version: version,
                rollbackAvailable: rollbackAvailable,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ImportRecordTable, ImportRecordData>(table),
                  $$ImportRecordTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({rotaAssignmentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (rotaAssignmentRefs) db.rotaAssignment,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (rotaAssignmentRefs)
                    await $_getPrefetchedData<
                      ImportRecordData,
                      $ImportRecordTable,
                      RotaAssignmentData
                    >(
                      currentTable: table,
                      referencedTable: $$ImportRecordTableReferences
                          ._rotaAssignmentRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ImportRecordTableReferences(
                            db,
                            table,
                            p0,
                          ).rotaAssignmentRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.sourceImportId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ImportRecordTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImportRecordTable,
      ImportRecordData,
      $$ImportRecordTableFilterComposer,
      $$ImportRecordTableOrderingComposer,
      $$ImportRecordTableAnnotationComposer,
      $$ImportRecordTableCreateCompanionBuilder,
      $$ImportRecordTableUpdateCompanionBuilder,
      (ImportRecordData, $$ImportRecordTableReferences),
      ImportRecordData,
      PrefetchHooks Function({bool rotaAssignmentRefs})
    >;
typedef $$RotaAssignmentTableCreateCompanionBuilder =
    RotaAssignmentCompanion Function({
      Value<int> id,
      required int staffId,
      required DateTime date,
      required String section,
      required String code,
      Value<String?> hoursStart,
      Value<String?> hoursEnd,
      Value<bool> qc2Duty,
      required String status,
      Value<int?> sourceImportId,
    });
typedef $$RotaAssignmentTableUpdateCompanionBuilder =
    RotaAssignmentCompanion Function({
      Value<int> id,
      Value<int> staffId,
      Value<DateTime> date,
      Value<String> section,
      Value<String> code,
      Value<String?> hoursStart,
      Value<String?> hoursEnd,
      Value<bool> qc2Duty,
      Value<String> status,
      Value<int?> sourceImportId,
    });

final class $$RotaAssignmentTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RotaAssignmentTable,
          RotaAssignmentData
        > {
  $$RotaAssignmentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StaffTable _staffIdTable(_$AppDatabase db) =>
      db.staff.createAlias('rota_assignment__staff_id__staff__id');

  $$StaffTableProcessedTableManager get staffId {
    final $_column = $_itemColumn<int>('staff_id')!;

    final manager = $$StaffTableTableManager(
      $_db,
      $_db.staff,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_staffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ImportRecordTable _sourceImportIdTable(_$AppDatabase db) => db
      .importRecord
      .createAlias('rota_assignment__source_import_id__import_record__id');

  $$ImportRecordTableProcessedTableManager? get sourceImportId {
    final $_column = $_itemColumn<int>('source_import_id');
    if ($_column == null) return null;
    final manager = $$ImportRecordTableTableManager(
      $_db,
      $_db.importRecord,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceImportIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RotaAssignmentTableFilterComposer
    extends Composer<_$AppDatabase, $RotaAssignmentTable> {
  $$RotaAssignmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hoursStart => $composableBuilder(
    column: $table.hoursStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hoursEnd => $composableBuilder(
    column: $table.hoursEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get qc2Duty => $composableBuilder(
    column: $table.qc2Duty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$StaffTableFilterComposer get staffId {
    final $$StaffTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableFilterComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ImportRecordTableFilterComposer get sourceImportId {
    final $$ImportRecordTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceImportId,
      referencedTable: $db.importRecord,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRecordTableFilterComposer(
            $db: $db,
            $table: $db.importRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RotaAssignmentTableOrderingComposer
    extends Composer<_$AppDatabase, $RotaAssignmentTable> {
  $$RotaAssignmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hoursStart => $composableBuilder(
    column: $table.hoursStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hoursEnd => $composableBuilder(
    column: $table.hoursEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get qc2Duty => $composableBuilder(
    column: $table.qc2Duty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$StaffTableOrderingComposer get staffId {
    final $$StaffTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableOrderingComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ImportRecordTableOrderingComposer get sourceImportId {
    final $$ImportRecordTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceImportId,
      referencedTable: $db.importRecord,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRecordTableOrderingComposer(
            $db: $db,
            $table: $db.importRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RotaAssignmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $RotaAssignmentTable> {
  $$RotaAssignmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get hoursStart => $composableBuilder(
    column: $table.hoursStart,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hoursEnd =>
      $composableBuilder(column: $table.hoursEnd, builder: (column) => column);

  GeneratedColumn<bool> get qc2Duty =>
      $composableBuilder(column: $table.qc2Duty, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$StaffTableAnnotationComposer get staffId {
    final $$StaffTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableAnnotationComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ImportRecordTableAnnotationComposer get sourceImportId {
    final $$ImportRecordTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceImportId,
      referencedTable: $db.importRecord,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRecordTableAnnotationComposer(
            $db: $db,
            $table: $db.importRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RotaAssignmentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RotaAssignmentTable,
          RotaAssignmentData,
          $$RotaAssignmentTableFilterComposer,
          $$RotaAssignmentTableOrderingComposer,
          $$RotaAssignmentTableAnnotationComposer,
          $$RotaAssignmentTableCreateCompanionBuilder,
          $$RotaAssignmentTableUpdateCompanionBuilder,
          (RotaAssignmentData, $$RotaAssignmentTableReferences),
          RotaAssignmentData,
          PrefetchHooks Function({bool staffId, bool sourceImportId})
        > {
  $$RotaAssignmentTableTableManager(
    _$AppDatabase db,
    $RotaAssignmentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RotaAssignmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RotaAssignmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RotaAssignmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> staffId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String?> hoursStart = const Value.absent(),
                Value<String?> hoursEnd = const Value.absent(),
                Value<bool> qc2Duty = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> sourceImportId = const Value.absent(),
              }) => RotaAssignmentCompanion(
                id: id,
                staffId: staffId,
                date: date,
                section: section,
                code: code,
                hoursStart: hoursStart,
                hoursEnd: hoursEnd,
                qc2Duty: qc2Duty,
                status: status,
                sourceImportId: sourceImportId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int staffId,
                required DateTime date,
                required String section,
                required String code,
                Value<String?> hoursStart = const Value.absent(),
                Value<String?> hoursEnd = const Value.absent(),
                Value<bool> qc2Duty = const Value.absent(),
                required String status,
                Value<int?> sourceImportId = const Value.absent(),
              }) => RotaAssignmentCompanion.insert(
                id: id,
                staffId: staffId,
                date: date,
                section: section,
                code: code,
                hoursStart: hoursStart,
                hoursEnd: hoursEnd,
                qc2Duty: qc2Duty,
                status: status,
                sourceImportId: sourceImportId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RotaAssignmentTable, RotaAssignmentData>(table),
                  $$RotaAssignmentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({staffId = false, sourceImportId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (staffId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.staffId,
                        referencedTable: $$RotaAssignmentTableReferences
                            ._staffIdTable(db),
                        referencedColumn: $$RotaAssignmentTableReferences
                            ._staffIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (sourceImportId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.sourceImportId,
                        referencedTable: $$RotaAssignmentTableReferences
                            ._sourceImportIdTable(db),
                        referencedColumn: $$RotaAssignmentTableReferences
                            ._sourceImportIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RotaAssignmentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RotaAssignmentTable,
      RotaAssignmentData,
      $$RotaAssignmentTableFilterComposer,
      $$RotaAssignmentTableOrderingComposer,
      $$RotaAssignmentTableAnnotationComposer,
      $$RotaAssignmentTableCreateCompanionBuilder,
      $$RotaAssignmentTableUpdateCompanionBuilder,
      (RotaAssignmentData, $$RotaAssignmentTableReferences),
      RotaAssignmentData,
      PrefetchHooks Function({bool staffId, bool sourceImportId})
    >;
typedef $$DutyAssignmentTableCreateCompanionBuilder =
    DutyAssignmentCompanion Function({
      Value<int> id,
      required DateTime date,
      required String section,
      Value<int?> inChargeStaffId,
      Value<int?> qc2StaffId,
    });
typedef $$DutyAssignmentTableUpdateCompanionBuilder =
    DutyAssignmentCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<String> section,
      Value<int?> inChargeStaffId,
      Value<int?> qc2StaffId,
    });

final class $$DutyAssignmentTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DutyAssignmentTable,
          DutyAssignmentData
        > {
  $$DutyAssignmentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StaffTable _inChargeStaffIdTable(_$AppDatabase db) =>
      db.staff.createAlias('duty_assignment__in_charge_staff_id__staff__id');

  $$StaffTableProcessedTableManager? get inChargeStaffId {
    final $_column = $_itemColumn<int>('in_charge_staff_id');
    if ($_column == null) return null;
    final manager = $$StaffTableTableManager(
      $_db,
      $_db.staff,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inChargeStaffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StaffTable _qc2StaffIdTable(_$AppDatabase db) =>
      db.staff.createAlias('duty_assignment__qc2_staff_id__staff__id');

  $$StaffTableProcessedTableManager? get qc2StaffId {
    final $_column = $_itemColumn<int>('qc2_staff_id');
    if ($_column == null) return null;
    final manager = $$StaffTableTableManager(
      $_db,
      $_db.staff,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_qc2StaffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DutyAssignmentTableFilterComposer
    extends Composer<_$AppDatabase, $DutyAssignmentTable> {
  $$DutyAssignmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnFilters(column),
  );

  $$StaffTableFilterComposer get inChargeStaffId {
    final $$StaffTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inChargeStaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableFilterComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StaffTableFilterComposer get qc2StaffId {
    final $$StaffTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.qc2StaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableFilterComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DutyAssignmentTableOrderingComposer
    extends Composer<_$AppDatabase, $DutyAssignmentTable> {
  $$DutyAssignmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnOrderings(column),
  );

  $$StaffTableOrderingComposer get inChargeStaffId {
    final $$StaffTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inChargeStaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableOrderingComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StaffTableOrderingComposer get qc2StaffId {
    final $$StaffTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.qc2StaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableOrderingComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DutyAssignmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $DutyAssignmentTable> {
  $$DutyAssignmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => column);

  $$StaffTableAnnotationComposer get inChargeStaffId {
    final $$StaffTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inChargeStaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableAnnotationComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StaffTableAnnotationComposer get qc2StaffId {
    final $$StaffTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.qc2StaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableAnnotationComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DutyAssignmentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DutyAssignmentTable,
          DutyAssignmentData,
          $$DutyAssignmentTableFilterComposer,
          $$DutyAssignmentTableOrderingComposer,
          $$DutyAssignmentTableAnnotationComposer,
          $$DutyAssignmentTableCreateCompanionBuilder,
          $$DutyAssignmentTableUpdateCompanionBuilder,
          (DutyAssignmentData, $$DutyAssignmentTableReferences),
          DutyAssignmentData,
          PrefetchHooks Function({bool inChargeStaffId, bool qc2StaffId})
        > {
  $$DutyAssignmentTableTableManager(
    _$AppDatabase db,
    $DutyAssignmentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DutyAssignmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DutyAssignmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DutyAssignmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<int?> inChargeStaffId = const Value.absent(),
                Value<int?> qc2StaffId = const Value.absent(),
              }) => DutyAssignmentCompanion(
                id: id,
                date: date,
                section: section,
                inChargeStaffId: inChargeStaffId,
                qc2StaffId: qc2StaffId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required String section,
                Value<int?> inChargeStaffId = const Value.absent(),
                Value<int?> qc2StaffId = const Value.absent(),
              }) => DutyAssignmentCompanion.insert(
                id: id,
                date: date,
                section: section,
                inChargeStaffId: inChargeStaffId,
                qc2StaffId: qc2StaffId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DutyAssignmentTable, DutyAssignmentData>(table),
                  $$DutyAssignmentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({inChargeStaffId = false, qc2StaffId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (inChargeStaffId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.inChargeStaffId,
                            referencedTable: $$DutyAssignmentTableReferences
                                ._inChargeStaffIdTable(db),
                            referencedColumn: $$DutyAssignmentTableReferences
                                ._inChargeStaffIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (qc2StaffId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.qc2StaffId,
                            referencedTable: $$DutyAssignmentTableReferences
                                ._qc2StaffIdTable(db),
                            referencedColumn: $$DutyAssignmentTableReferences
                                ._qc2StaffIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$DutyAssignmentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DutyAssignmentTable,
      DutyAssignmentData,
      $$DutyAssignmentTableFilterComposer,
      $$DutyAssignmentTableOrderingComposer,
      $$DutyAssignmentTableAnnotationComposer,
      $$DutyAssignmentTableCreateCompanionBuilder,
      $$DutyAssignmentTableUpdateCompanionBuilder,
      (DutyAssignmentData, $$DutyAssignmentTableReferences),
      DutyAssignmentData,
      PrefetchHooks Function({bool inChargeStaffId, bool qc2StaffId})
    >;
typedef $$ShiftCodeTableCreateCompanionBuilder = ShiftCodeCompanion Function({
  required String code,
  required String label,
  Value<String?> hoursStart,
  Value<String?> hoursEnd,
  Value<String?> colorHex,
  Value<bool> isCustom,
  Value<int> rowid,
});
typedef $$ShiftCodeTableUpdateCompanionBuilder = ShiftCodeCompanion Function({
  Value<String> code,
  Value<String> label,
  Value<String?> hoursStart,
  Value<String?> hoursEnd,
  Value<String?> colorHex,
  Value<bool> isCustom,
  Value<int> rowid,
});

class $$ShiftCodeTableFilterComposer
    extends Composer<_$AppDatabase, $ShiftCodeTable> {
  $$ShiftCodeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hoursStart => $composableBuilder(
    column: $table.hoursStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hoursEnd => $composableBuilder(
    column: $table.hoursEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShiftCodeTableOrderingComposer
    extends Composer<_$AppDatabase, $ShiftCodeTable> {
  $$ShiftCodeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hoursStart => $composableBuilder(
    column: $table.hoursStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hoursEnd => $composableBuilder(
    column: $table.hoursEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShiftCodeTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShiftCodeTable> {
  $$ShiftCodeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get hoursStart => $composableBuilder(
    column: $table.hoursStart,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hoursEnd =>
      $composableBuilder(column: $table.hoursEnd, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);
}

class $$ShiftCodeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShiftCodeTable,
          ShiftCodeData,
          $$ShiftCodeTableFilterComposer,
          $$ShiftCodeTableOrderingComposer,
          $$ShiftCodeTableAnnotationComposer,
          $$ShiftCodeTableCreateCompanionBuilder,
          $$ShiftCodeTableUpdateCompanionBuilder,
          (
            ShiftCodeData,
            BaseReferences<_$AppDatabase, $ShiftCodeTable, ShiftCodeData>,
          ),
          ShiftCodeData,
          PrefetchHooks Function()
        > {
  $$ShiftCodeTableTableManager(_$AppDatabase db, $ShiftCodeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShiftCodeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShiftCodeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShiftCodeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String?> hoursStart = const Value.absent(),
                Value<String?> hoursEnd = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShiftCodeCompanion(
                code: code,
                label: label,
                hoursStart: hoursStart,
                hoursEnd: hoursEnd,
                colorHex: colorHex,
                isCustom: isCustom,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required String label,
                Value<String?> hoursStart = const Value.absent(),
                Value<String?> hoursEnd = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShiftCodeCompanion.insert(
                code: code,
                label: label,
                hoursStart: hoursStart,
                hoursEnd: hoursEnd,
                colorHex: colorHex,
                isCustom: isCustom,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ShiftCodeTable, ShiftCodeData>(table),
                  BaseReferences<_$AppDatabase, $ShiftCodeTable, ShiftCodeData>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShiftCodeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShiftCodeTable,
      ShiftCodeData,
      $$ShiftCodeTableFilterComposer,
      $$ShiftCodeTableOrderingComposer,
      $$ShiftCodeTableAnnotationComposer,
      $$ShiftCodeTableCreateCompanionBuilder,
      $$ShiftCodeTableUpdateCompanionBuilder,
      (
        ShiftCodeData,
        BaseReferences<_$AppDatabase, $ShiftCodeTable, ShiftCodeData>,
      ),
      ShiftCodeData,
      PrefetchHooks Function()
    >;
typedef $$ManualCategoryTableCreateCompanionBuilder =
    ManualCategoryCompanion Function({
      Value<int> id,
      required String name,
      required String colorHex,
      required String icon,
    });
typedef $$ManualCategoryTableUpdateCompanionBuilder =
    ManualCategoryCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> colorHex,
      Value<String> icon,
    });

final class $$ManualCategoryTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ManualCategoryTable,
          ManualCategoryData
        > {
  $$ManualCategoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ManualDocumentTable, List<ManualDocumentData>>
  _manualDocumentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.manualDocument,
    aliasName: 'manual_category__id__manual_document__category_id',
  );

  $$ManualDocumentTableProcessedTableManager get manualDocumentRefs {
    final manager = $$ManualDocumentTableTableManager(
      $_db,
      $_db.manualDocument,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_manualDocumentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ManualCategoryTableFilterComposer
    extends Composer<_$AppDatabase, $ManualCategoryTable> {
  $$ManualCategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> manualDocumentRefs(
    Expression<bool> Function($$ManualDocumentTableFilterComposer f) f,
  ) {
    final $$ManualDocumentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.manualDocument,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ManualDocumentTableFilterComposer(
            $db: $db,
            $table: $db.manualDocument,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ManualCategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $ManualCategoryTable> {
  $$ManualCategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ManualCategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $ManualCategoryTable> {
  $$ManualCategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  Expression<T> manualDocumentRefs<T extends Object>(
    Expression<T> Function($$ManualDocumentTableAnnotationComposer a) f,
  ) {
    final $$ManualDocumentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.manualDocument,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ManualDocumentTableAnnotationComposer(
            $db: $db,
            $table: $db.manualDocument,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ManualCategoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ManualCategoryTable,
          ManualCategoryData,
          $$ManualCategoryTableFilterComposer,
          $$ManualCategoryTableOrderingComposer,
          $$ManualCategoryTableAnnotationComposer,
          $$ManualCategoryTableCreateCompanionBuilder,
          $$ManualCategoryTableUpdateCompanionBuilder,
          (ManualCategoryData, $$ManualCategoryTableReferences),
          ManualCategoryData,
          PrefetchHooks Function({bool manualDocumentRefs})
        > {
  $$ManualCategoryTableTableManager(
    _$AppDatabase db,
    $ManualCategoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ManualCategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ManualCategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ManualCategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> colorHex = const Value.absent(),
                Value<String> icon = const Value.absent(),
              }) => ManualCategoryCompanion(
                id: id,
                name: name,
                colorHex: colorHex,
                icon: icon,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String colorHex,
                required String icon,
              }) => ManualCategoryCompanion.insert(
                id: id,
                name: name,
                colorHex: colorHex,
                icon: icon,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ManualCategoryTable, ManualCategoryData>(table),
                  $$ManualCategoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({manualDocumentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (manualDocumentRefs) db.manualDocument,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (manualDocumentRefs)
                    await $_getPrefetchedData<
                      ManualCategoryData,
                      $ManualCategoryTable,
                      ManualDocumentData
                    >(
                      currentTable: table,
                      referencedTable: $$ManualCategoryTableReferences
                          ._manualDocumentRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ManualCategoryTableReferences(
                            db,
                            table,
                            p0,
                          ).manualDocumentRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ManualCategoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ManualCategoryTable,
      ManualCategoryData,
      $$ManualCategoryTableFilterComposer,
      $$ManualCategoryTableOrderingComposer,
      $$ManualCategoryTableAnnotationComposer,
      $$ManualCategoryTableCreateCompanionBuilder,
      $$ManualCategoryTableUpdateCompanionBuilder,
      (ManualCategoryData, $$ManualCategoryTableReferences),
      ManualCategoryData,
      PrefetchHooks Function({bool manualDocumentRefs})
    >;
typedef $$ManualDocumentTableCreateCompanionBuilder =
    ManualDocumentCompanion Function({
      Value<int> id,
      required String title,
      required int categoryId,
      Value<String?> reference,
      Value<String?> version,
      Value<String?> description,
      required String fileType,
      Value<String?> localFilePath,
      Value<int?> pageCount,
      Value<int?> durationSeconds,
      Value<int?> fileSizeBytes,
      Value<String?> bodyText,
      Value<String?> owningTeam,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> lastOpenedAt,
    });
typedef $$ManualDocumentTableUpdateCompanionBuilder =
    ManualDocumentCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<int> categoryId,
      Value<String?> reference,
      Value<String?> version,
      Value<String?> description,
      Value<String> fileType,
      Value<String?> localFilePath,
      Value<int?> pageCount,
      Value<int?> durationSeconds,
      Value<int?> fileSizeBytes,
      Value<String?> bodyText,
      Value<String?> owningTeam,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> lastOpenedAt,
    });

final class $$ManualDocumentTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ManualDocumentTable,
          ManualDocumentData
        > {
  $$ManualDocumentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ManualCategoryTable _categoryIdTable(_$AppDatabase db) => db
      .manualCategory
      .createAlias('manual_document__category_id__manual_category__id');

  $$ManualCategoryTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$ManualCategoryTableTableManager(
      $_db,
      $_db.manualCategory,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ManualDocumentTableFilterComposer
    extends Composer<_$AppDatabase, $ManualDocumentTable> {
  $$ManualDocumentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyText => $composableBuilder(
    column: $table.bodyText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get owningTeam => $composableBuilder(
    column: $table.owningTeam,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ManualCategoryTableFilterComposer get categoryId {
    final $$ManualCategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.manualCategory,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ManualCategoryTableFilterComposer(
            $db: $db,
            $table: $db.manualCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ManualDocumentTableOrderingComposer
    extends Composer<_$AppDatabase, $ManualDocumentTable> {
  $$ManualDocumentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyText => $composableBuilder(
    column: $table.bodyText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get owningTeam => $composableBuilder(
    column: $table.owningTeam,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ManualCategoryTableOrderingComposer get categoryId {
    final $$ManualCategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.manualCategory,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ManualCategoryTableOrderingComposer(
            $db: $db,
            $table: $db.manualCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ManualDocumentTableAnnotationComposer
    extends Composer<_$AppDatabase, $ManualDocumentTable> {
  $$ManualDocumentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pageCount =>
      $composableBuilder(column: $table.pageCount, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bodyText =>
      $composableBuilder(column: $table.bodyText, builder: (column) => column);

  GeneratedColumn<String> get owningTeam => $composableBuilder(
    column: $table.owningTeam,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => column,
  );

  $$ManualCategoryTableAnnotationComposer get categoryId {
    final $$ManualCategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.manualCategory,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ManualCategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.manualCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ManualDocumentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ManualDocumentTable,
          ManualDocumentData,
          $$ManualDocumentTableFilterComposer,
          $$ManualDocumentTableOrderingComposer,
          $$ManualDocumentTableAnnotationComposer,
          $$ManualDocumentTableCreateCompanionBuilder,
          $$ManualDocumentTableUpdateCompanionBuilder,
          (ManualDocumentData, $$ManualDocumentTableReferences),
          ManualDocumentData,
          PrefetchHooks Function({bool categoryId})
        > {
  $$ManualDocumentTableTableManager(
    _$AppDatabase db,
    $ManualDocumentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ManualDocumentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ManualDocumentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ManualDocumentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<String?> version = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<String?> localFilePath = const Value.absent(),
                Value<int?> pageCount = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<int?> fileSizeBytes = const Value.absent(),
                Value<String?> bodyText = const Value.absent(),
                Value<String?> owningTeam = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> lastOpenedAt = const Value.absent(),
              }) => ManualDocumentCompanion(
                id: id,
                title: title,
                categoryId: categoryId,
                reference: reference,
                version: version,
                description: description,
                fileType: fileType,
                localFilePath: localFilePath,
                pageCount: pageCount,
                durationSeconds: durationSeconds,
                fileSizeBytes: fileSizeBytes,
                bodyText: bodyText,
                owningTeam: owningTeam,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastOpenedAt: lastOpenedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required int categoryId,
                Value<String?> reference = const Value.absent(),
                Value<String?> version = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required String fileType,
                Value<String?> localFilePath = const Value.absent(),
                Value<int?> pageCount = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<int?> fileSizeBytes = const Value.absent(),
                Value<String?> bodyText = const Value.absent(),
                Value<String?> owningTeam = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> lastOpenedAt = const Value.absent(),
              }) => ManualDocumentCompanion.insert(
                id: id,
                title: title,
                categoryId: categoryId,
                reference: reference,
                version: version,
                description: description,
                fileType: fileType,
                localFilePath: localFilePath,
                pageCount: pageCount,
                durationSeconds: durationSeconds,
                fileSizeBytes: fileSizeBytes,
                bodyText: bodyText,
                owningTeam: owningTeam,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastOpenedAt: lastOpenedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ManualDocumentTable, ManualDocumentData>(table),
                  $$ManualDocumentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.categoryId,
                        referencedTable: $$ManualDocumentTableReferences
                            ._categoryIdTable(db),
                        referencedColumn: $$ManualDocumentTableReferences
                            ._categoryIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ManualDocumentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ManualDocumentTable,
      ManualDocumentData,
      $$ManualDocumentTableFilterComposer,
      $$ManualDocumentTableOrderingComposer,
      $$ManualDocumentTableAnnotationComposer,
      $$ManualDocumentTableCreateCompanionBuilder,
      $$ManualDocumentTableUpdateCompanionBuilder,
      (ManualDocumentData, $$ManualDocumentTableReferences),
      ManualDocumentData,
      PrefetchHooks Function({bool categoryId})
    >;
typedef $$SegContentCategoryRowTableCreateCompanionBuilder =
    SegContentCategoryRowCompanion Function({
      Value<int> id,
      required String contentCategory,
      Value<String?> shahidSegmentation,
      Value<String?> mbcSegmentation,
      Value<String?> requiredNotes,
      Value<String?> examples,
    });
typedef $$SegContentCategoryRowTableUpdateCompanionBuilder =
    SegContentCategoryRowCompanion Function({
      Value<int> id,
      Value<String> contentCategory,
      Value<String?> shahidSegmentation,
      Value<String?> mbcSegmentation,
      Value<String?> requiredNotes,
      Value<String?> examples,
    });

class $$SegContentCategoryRowTableFilterComposer
    extends Composer<_$AppDatabase, $SegContentCategoryRowTable> {
  $$SegContentCategoryRowTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentCategory => $composableBuilder(
    column: $table.contentCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shahidSegmentation => $composableBuilder(
    column: $table.shahidSegmentation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mbcSegmentation => $composableBuilder(
    column: $table.mbcSegmentation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requiredNotes => $composableBuilder(
    column: $table.requiredNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examples => $composableBuilder(
    column: $table.examples,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SegContentCategoryRowTableOrderingComposer
    extends Composer<_$AppDatabase, $SegContentCategoryRowTable> {
  $$SegContentCategoryRowTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentCategory => $composableBuilder(
    column: $table.contentCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shahidSegmentation => $composableBuilder(
    column: $table.shahidSegmentation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mbcSegmentation => $composableBuilder(
    column: $table.mbcSegmentation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requiredNotes => $composableBuilder(
    column: $table.requiredNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examples => $composableBuilder(
    column: $table.examples,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SegContentCategoryRowTableAnnotationComposer
    extends Composer<_$AppDatabase, $SegContentCategoryRowTable> {
  $$SegContentCategoryRowTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get contentCategory => $composableBuilder(
    column: $table.contentCategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shahidSegmentation => $composableBuilder(
    column: $table.shahidSegmentation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mbcSegmentation => $composableBuilder(
    column: $table.mbcSegmentation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requiredNotes => $composableBuilder(
    column: $table.requiredNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get examples =>
      $composableBuilder(column: $table.examples, builder: (column) => column);
}

class $$SegContentCategoryRowTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SegContentCategoryRowTable,
          SegContentCategoryRowData,
          $$SegContentCategoryRowTableFilterComposer,
          $$SegContentCategoryRowTableOrderingComposer,
          $$SegContentCategoryRowTableAnnotationComposer,
          $$SegContentCategoryRowTableCreateCompanionBuilder,
          $$SegContentCategoryRowTableUpdateCompanionBuilder,
          (
            SegContentCategoryRowData,
            BaseReferences<
              _$AppDatabase,
              $SegContentCategoryRowTable,
              SegContentCategoryRowData
            >,
          ),
          SegContentCategoryRowData,
          PrefetchHooks Function()
        > {
  $$SegContentCategoryRowTableTableManager(
    _$AppDatabase db,
    $SegContentCategoryRowTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SegContentCategoryRowTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SegContentCategoryRowTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SegContentCategoryRowTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> contentCategory = const Value.absent(),
                Value<String?> shahidSegmentation = const Value.absent(),
                Value<String?> mbcSegmentation = const Value.absent(),
                Value<String?> requiredNotes = const Value.absent(),
                Value<String?> examples = const Value.absent(),
              }) => SegContentCategoryRowCompanion(
                id: id,
                contentCategory: contentCategory,
                shahidSegmentation: shahidSegmentation,
                mbcSegmentation: mbcSegmentation,
                requiredNotes: requiredNotes,
                examples: examples,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String contentCategory,
                Value<String?> shahidSegmentation = const Value.absent(),
                Value<String?> mbcSegmentation = const Value.absent(),
                Value<String?> requiredNotes = const Value.absent(),
                Value<String?> examples = const Value.absent(),
              }) => SegContentCategoryRowCompanion.insert(
                id: id,
                contentCategory: contentCategory,
                shahidSegmentation: shahidSegmentation,
                mbcSegmentation: mbcSegmentation,
                requiredNotes: requiredNotes,
                examples: examples,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $SegContentCategoryRowTable,
                    SegContentCategoryRowData
                  >(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SegContentCategoryRowTable,
                    SegContentCategoryRowData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SegContentCategoryRowTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SegContentCategoryRowTable,
      SegContentCategoryRowData,
      $$SegContentCategoryRowTableFilterComposer,
      $$SegContentCategoryRowTableOrderingComposer,
      $$SegContentCategoryRowTableAnnotationComposer,
      $$SegContentCategoryRowTableCreateCompanionBuilder,
      $$SegContentCategoryRowTableUpdateCompanionBuilder,
      (
        SegContentCategoryRowData,
        BaseReferences<
          _$AppDatabase,
          $SegContentCategoryRowTable,
          SegContentCategoryRowData
        >,
      ),
      SegContentCategoryRowData,
      PrefetchHooks Function()
    >;
typedef $$SegSpecialFileGroupRowTableCreateCompanionBuilder =
    SegSpecialFileGroupRowCompanion Function({
      Value<int> id,
      required String fileGroup,
      Value<String?> usage,
      Value<String?> channel,
      Value<String?> requiredTreatment,
      Value<String?> notes,
    });
typedef $$SegSpecialFileGroupRowTableUpdateCompanionBuilder =
    SegSpecialFileGroupRowCompanion Function({
      Value<int> id,
      Value<String> fileGroup,
      Value<String?> usage,
      Value<String?> channel,
      Value<String?> requiredTreatment,
      Value<String?> notes,
    });

class $$SegSpecialFileGroupRowTableFilterComposer
    extends Composer<_$AppDatabase, $SegSpecialFileGroupRowTable> {
  $$SegSpecialFileGroupRowTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileGroup => $composableBuilder(
    column: $table.fileGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usage => $composableBuilder(
    column: $table.usage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requiredTreatment => $composableBuilder(
    column: $table.requiredTreatment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SegSpecialFileGroupRowTableOrderingComposer
    extends Composer<_$AppDatabase, $SegSpecialFileGroupRowTable> {
  $$SegSpecialFileGroupRowTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileGroup => $composableBuilder(
    column: $table.fileGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usage => $composableBuilder(
    column: $table.usage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requiredTreatment => $composableBuilder(
    column: $table.requiredTreatment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SegSpecialFileGroupRowTableAnnotationComposer
    extends Composer<_$AppDatabase, $SegSpecialFileGroupRowTable> {
  $$SegSpecialFileGroupRowTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileGroup =>
      $composableBuilder(column: $table.fileGroup, builder: (column) => column);

  GeneratedColumn<String> get usage =>
      $composableBuilder(column: $table.usage, builder: (column) => column);

  GeneratedColumn<String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<String> get requiredTreatment => $composableBuilder(
    column: $table.requiredTreatment,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$SegSpecialFileGroupRowTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SegSpecialFileGroupRowTable,
          SegSpecialFileGroupRowData,
          $$SegSpecialFileGroupRowTableFilterComposer,
          $$SegSpecialFileGroupRowTableOrderingComposer,
          $$SegSpecialFileGroupRowTableAnnotationComposer,
          $$SegSpecialFileGroupRowTableCreateCompanionBuilder,
          $$SegSpecialFileGroupRowTableUpdateCompanionBuilder,
          (
            SegSpecialFileGroupRowData,
            BaseReferences<
              _$AppDatabase,
              $SegSpecialFileGroupRowTable,
              SegSpecialFileGroupRowData
            >,
          ),
          SegSpecialFileGroupRowData,
          PrefetchHooks Function()
        > {
  $$SegSpecialFileGroupRowTableTableManager(
    _$AppDatabase db,
    $SegSpecialFileGroupRowTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SegSpecialFileGroupRowTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SegSpecialFileGroupRowTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SegSpecialFileGroupRowTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fileGroup = const Value.absent(),
                Value<String?> usage = const Value.absent(),
                Value<String?> channel = const Value.absent(),
                Value<String?> requiredTreatment = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => SegSpecialFileGroupRowCompanion(
                id: id,
                fileGroup: fileGroup,
                usage: usage,
                channel: channel,
                requiredTreatment: requiredTreatment,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fileGroup,
                Value<String?> usage = const Value.absent(),
                Value<String?> channel = const Value.absent(),
                Value<String?> requiredTreatment = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => SegSpecialFileGroupRowCompanion.insert(
                id: id,
                fileGroup: fileGroup,
                usage: usage,
                channel: channel,
                requiredTreatment: requiredTreatment,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $SegSpecialFileGroupRowTable,
                    SegSpecialFileGroupRowData
                  >(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SegSpecialFileGroupRowTable,
                    SegSpecialFileGroupRowData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SegSpecialFileGroupRowTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SegSpecialFileGroupRowTable,
      SegSpecialFileGroupRowData,
      $$SegSpecialFileGroupRowTableFilterComposer,
      $$SegSpecialFileGroupRowTableOrderingComposer,
      $$SegSpecialFileGroupRowTableAnnotationComposer,
      $$SegSpecialFileGroupRowTableCreateCompanionBuilder,
      $$SegSpecialFileGroupRowTableUpdateCompanionBuilder,
      (
        SegSpecialFileGroupRowData,
        BaseReferences<
          _$AppDatabase,
          $SegSpecialFileGroupRowTable,
          SegSpecialFileGroupRowData
        >,
      ),
      SegSpecialFileGroupRowData,
      PrefetchHooks Function()
    >;
typedef $$SegGlossaryRowTableCreateCompanionBuilder =
    SegGlossaryRowCompanion Function({
      Value<int> id,
      required String term,
      Value<String?> meaning,
      Value<String?> example,
      Value<String?> relatedProcedure,
    });
typedef $$SegGlossaryRowTableUpdateCompanionBuilder =
    SegGlossaryRowCompanion Function({
      Value<int> id,
      Value<String> term,
      Value<String?> meaning,
      Value<String?> example,
      Value<String?> relatedProcedure,
    });

class $$SegGlossaryRowTableFilterComposer
    extends Composer<_$AppDatabase, $SegGlossaryRowTable> {
  $$SegGlossaryRowTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get term => $composableBuilder(
    column: $table.term,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get example => $composableBuilder(
    column: $table.example,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedProcedure => $composableBuilder(
    column: $table.relatedProcedure,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SegGlossaryRowTableOrderingComposer
    extends Composer<_$AppDatabase, $SegGlossaryRowTable> {
  $$SegGlossaryRowTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get term => $composableBuilder(
    column: $table.term,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get example => $composableBuilder(
    column: $table.example,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedProcedure => $composableBuilder(
    column: $table.relatedProcedure,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SegGlossaryRowTableAnnotationComposer
    extends Composer<_$AppDatabase, $SegGlossaryRowTable> {
  $$SegGlossaryRowTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get term =>
      $composableBuilder(column: $table.term, builder: (column) => column);

  GeneratedColumn<String> get meaning =>
      $composableBuilder(column: $table.meaning, builder: (column) => column);

  GeneratedColumn<String> get example =>
      $composableBuilder(column: $table.example, builder: (column) => column);

  GeneratedColumn<String> get relatedProcedure => $composableBuilder(
    column: $table.relatedProcedure,
    builder: (column) => column,
  );
}

class $$SegGlossaryRowTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SegGlossaryRowTable,
          SegGlossaryRowData,
          $$SegGlossaryRowTableFilterComposer,
          $$SegGlossaryRowTableOrderingComposer,
          $$SegGlossaryRowTableAnnotationComposer,
          $$SegGlossaryRowTableCreateCompanionBuilder,
          $$SegGlossaryRowTableUpdateCompanionBuilder,
          (
            SegGlossaryRowData,
            BaseReferences<
              _$AppDatabase,
              $SegGlossaryRowTable,
              SegGlossaryRowData
            >,
          ),
          SegGlossaryRowData,
          PrefetchHooks Function()
        > {
  $$SegGlossaryRowTableTableManager(
    _$AppDatabase db,
    $SegGlossaryRowTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SegGlossaryRowTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SegGlossaryRowTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SegGlossaryRowTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> term = const Value.absent(),
                Value<String?> meaning = const Value.absent(),
                Value<String?> example = const Value.absent(),
                Value<String?> relatedProcedure = const Value.absent(),
              }) => SegGlossaryRowCompanion(
                id: id,
                term: term,
                meaning: meaning,
                example: example,
                relatedProcedure: relatedProcedure,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String term,
                Value<String?> meaning = const Value.absent(),
                Value<String?> example = const Value.absent(),
                Value<String?> relatedProcedure = const Value.absent(),
              }) => SegGlossaryRowCompanion.insert(
                id: id,
                term: term,
                meaning: meaning,
                example: example,
                relatedProcedure: relatedProcedure,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SegGlossaryRowTable, SegGlossaryRowData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SegGlossaryRowTable,
                    SegGlossaryRowData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SegGlossaryRowTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SegGlossaryRowTable,
      SegGlossaryRowData,
      $$SegGlossaryRowTableFilterComposer,
      $$SegGlossaryRowTableOrderingComposer,
      $$SegGlossaryRowTableAnnotationComposer,
      $$SegGlossaryRowTableCreateCompanionBuilder,
      $$SegGlossaryRowTableUpdateCompanionBuilder,
      (
        SegGlossaryRowData,
        BaseReferences<_$AppDatabase, $SegGlossaryRowTable, SegGlossaryRowData>,
      ),
      SegGlossaryRowData,
      PrefetchHooks Function()
    >;
typedef $$ContactTableCreateCompanionBuilder = ContactCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> jobTitle,
  required String team,
  Value<String?> channels,
  Value<String?> areas,
  Value<String?> extension,
  Value<String?> email,
  Value<String?> notesEncrypted,
  Value<bool> favorite,
  Value<int?> linkedStaffId,
});
typedef $$ContactTableUpdateCompanionBuilder = ContactCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> jobTitle,
  Value<String> team,
  Value<String?> channels,
  Value<String?> areas,
  Value<String?> extension,
  Value<String?> email,
  Value<String?> notesEncrypted,
  Value<bool> favorite,
  Value<int?> linkedStaffId,
});

final class $$ContactTableReferences
    extends BaseReferences<_$AppDatabase, $ContactTable, ContactData> {
  $$ContactTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StaffTable _linkedStaffIdTable(_$AppDatabase db) =>
      db.staff.createAlias('contact__linked_staff_id__staff__id');

  $$StaffTableProcessedTableManager? get linkedStaffId {
    final $_column = $_itemColumn<int>('linked_staff_id');
    if ($_column == null) return null;
    final manager = $$StaffTableTableManager(
      $_db,
      $_db.staff,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_linkedStaffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ContactTableFilterComposer
    extends Composer<_$AppDatabase, $ContactTable> {
  $$ContactTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobTitle => $composableBuilder(
    column: $table.jobTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get team => $composableBuilder(
    column: $table.team,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channels => $composableBuilder(
    column: $table.channels,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get areas => $composableBuilder(
    column: $table.areas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notesEncrypted => $composableBuilder(
    column: $table.notesEncrypted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnFilters(column),
  );

  $$StaffTableFilterComposer get linkedStaffId {
    final $$StaffTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkedStaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableFilterComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactTableOrderingComposer
    extends Composer<_$AppDatabase, $ContactTable> {
  $$ContactTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobTitle => $composableBuilder(
    column: $table.jobTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get team => $composableBuilder(
    column: $table.team,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channels => $composableBuilder(
    column: $table.channels,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get areas => $composableBuilder(
    column: $table.areas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notesEncrypted => $composableBuilder(
    column: $table.notesEncrypted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnOrderings(column),
  );

  $$StaffTableOrderingComposer get linkedStaffId {
    final $$StaffTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkedStaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableOrderingComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContactTable> {
  $$ContactTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get jobTitle =>
      $composableBuilder(column: $table.jobTitle, builder: (column) => column);

  GeneratedColumn<String> get team =>
      $composableBuilder(column: $table.team, builder: (column) => column);

  GeneratedColumn<String> get channels =>
      $composableBuilder(column: $table.channels, builder: (column) => column);

  GeneratedColumn<String> get areas =>
      $composableBuilder(column: $table.areas, builder: (column) => column);

  GeneratedColumn<String> get extension =>
      $composableBuilder(column: $table.extension, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get notesEncrypted => $composableBuilder(
    column: $table.notesEncrypted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);

  $$StaffTableAnnotationComposer get linkedStaffId {
    final $$StaffTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkedStaffId,
      referencedTable: $db.staff,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StaffTableAnnotationComposer(
            $db: $db,
            $table: $db.staff,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContactTable,
          ContactData,
          $$ContactTableFilterComposer,
          $$ContactTableOrderingComposer,
          $$ContactTableAnnotationComposer,
          $$ContactTableCreateCompanionBuilder,
          $$ContactTableUpdateCompanionBuilder,
          (ContactData, $$ContactTableReferences),
          ContactData,
          PrefetchHooks Function({bool linkedStaffId})
        > {
  $$ContactTableTableManager(_$AppDatabase db, $ContactTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> jobTitle = const Value.absent(),
                Value<String> team = const Value.absent(),
                Value<String?> channels = const Value.absent(),
                Value<String?> areas = const Value.absent(),
                Value<String?> extension = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> notesEncrypted = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                Value<int?> linkedStaffId = const Value.absent(),
              }) => ContactCompanion(
                id: id,
                name: name,
                jobTitle: jobTitle,
                team: team,
                channels: channels,
                areas: areas,
                extension: extension,
                email: email,
                notesEncrypted: notesEncrypted,
                favorite: favorite,
                linkedStaffId: linkedStaffId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> jobTitle = const Value.absent(),
                required String team,
                Value<String?> channels = const Value.absent(),
                Value<String?> areas = const Value.absent(),
                Value<String?> extension = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> notesEncrypted = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                Value<int?> linkedStaffId = const Value.absent(),
              }) => ContactCompanion.insert(
                id: id,
                name: name,
                jobTitle: jobTitle,
                team: team,
                channels: channels,
                areas: areas,
                extension: extension,
                email: email,
                notesEncrypted: notesEncrypted,
                favorite: favorite,
                linkedStaffId: linkedStaffId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ContactTable, ContactData>(table),
                  $$ContactTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({linkedStaffId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (linkedStaffId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.linkedStaffId,
                        referencedTable: $$ContactTableReferences
                            ._linkedStaffIdTable(db),
                        referencedColumn: $$ContactTableReferences
                            ._linkedStaffIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ContactTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContactTable,
      ContactData,
      $$ContactTableFilterComposer,
      $$ContactTableOrderingComposer,
      $$ContactTableAnnotationComposer,
      $$ContactTableCreateCompanionBuilder,
      $$ContactTableUpdateCompanionBuilder,
      (ContactData, $$ContactTableReferences),
      ContactData,
      PrefetchHooks Function({bool linkedStaffId})
    >;
typedef $$BlacklistEntryTableCreateCompanionBuilder =
    BlacklistEntryCompanion Function({
      Value<int> id,
      required String name,
      required String category,
      Value<String?> aliases,
      Value<String?> programs,
      required String status,
      Value<String?> reasonEncrypted,
      Value<String?> sourceEncrypted,
      required DateTime dateAdded,
      Value<DateTime?> lastReviewed,
      Value<String?> reviewOwner,
      Value<String?> notesEncrypted,
      Value<bool> active,
    });
typedef $$BlacklistEntryTableUpdateCompanionBuilder =
    BlacklistEntryCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> category,
      Value<String?> aliases,
      Value<String?> programs,
      Value<String> status,
      Value<String?> reasonEncrypted,
      Value<String?> sourceEncrypted,
      Value<DateTime> dateAdded,
      Value<DateTime?> lastReviewed,
      Value<String?> reviewOwner,
      Value<String?> notesEncrypted,
      Value<bool> active,
    });

class $$BlacklistEntryTableFilterComposer
    extends Composer<_$AppDatabase, $BlacklistEntryTable> {
  $$BlacklistEntryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get programs => $composableBuilder(
    column: $table.programs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reasonEncrypted => $composableBuilder(
    column: $table.reasonEncrypted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceEncrypted => $composableBuilder(
    column: $table.sourceEncrypted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewed => $composableBuilder(
    column: $table.lastReviewed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reviewOwner => $composableBuilder(
    column: $table.reviewOwner,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notesEncrypted => $composableBuilder(
    column: $table.notesEncrypted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BlacklistEntryTableOrderingComposer
    extends Composer<_$AppDatabase, $BlacklistEntryTable> {
  $$BlacklistEntryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get programs => $composableBuilder(
    column: $table.programs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reasonEncrypted => $composableBuilder(
    column: $table.reasonEncrypted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceEncrypted => $composableBuilder(
    column: $table.sourceEncrypted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewed => $composableBuilder(
    column: $table.lastReviewed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reviewOwner => $composableBuilder(
    column: $table.reviewOwner,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notesEncrypted => $composableBuilder(
    column: $table.notesEncrypted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BlacklistEntryTableAnnotationComposer
    extends Composer<_$AppDatabase, $BlacklistEntryTable> {
  $$BlacklistEntryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<String> get programs =>
      $composableBuilder(column: $table.programs, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get reasonEncrypted => $composableBuilder(
    column: $table.reasonEncrypted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceEncrypted => $composableBuilder(
    column: $table.sourceEncrypted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewed => $composableBuilder(
    column: $table.lastReviewed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reviewOwner => $composableBuilder(
    column: $table.reviewOwner,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notesEncrypted => $composableBuilder(
    column: $table.notesEncrypted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$BlacklistEntryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BlacklistEntryTable,
          BlacklistEntryData,
          $$BlacklistEntryTableFilterComposer,
          $$BlacklistEntryTableOrderingComposer,
          $$BlacklistEntryTableAnnotationComposer,
          $$BlacklistEntryTableCreateCompanionBuilder,
          $$BlacklistEntryTableUpdateCompanionBuilder,
          (
            BlacklistEntryData,
            BaseReferences<
              _$AppDatabase,
              $BlacklistEntryTable,
              BlacklistEntryData
            >,
          ),
          BlacklistEntryData,
          PrefetchHooks Function()
        > {
  $$BlacklistEntryTableTableManager(
    _$AppDatabase db,
    $BlacklistEntryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlacklistEntryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlacklistEntryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlacklistEntryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> aliases = const Value.absent(),
                Value<String?> programs = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> reasonEncrypted = const Value.absent(),
                Value<String?> sourceEncrypted = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
                Value<DateTime?> lastReviewed = const Value.absent(),
                Value<String?> reviewOwner = const Value.absent(),
                Value<String?> notesEncrypted = const Value.absent(),
                Value<bool> active = const Value.absent(),
              }) => BlacklistEntryCompanion(
                id: id,
                name: name,
                category: category,
                aliases: aliases,
                programs: programs,
                status: status,
                reasonEncrypted: reasonEncrypted,
                sourceEncrypted: sourceEncrypted,
                dateAdded: dateAdded,
                lastReviewed: lastReviewed,
                reviewOwner: reviewOwner,
                notesEncrypted: notesEncrypted,
                active: active,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String category,
                Value<String?> aliases = const Value.absent(),
                Value<String?> programs = const Value.absent(),
                required String status,
                Value<String?> reasonEncrypted = const Value.absent(),
                Value<String?> sourceEncrypted = const Value.absent(),
                required DateTime dateAdded,
                Value<DateTime?> lastReviewed = const Value.absent(),
                Value<String?> reviewOwner = const Value.absent(),
                Value<String?> notesEncrypted = const Value.absent(),
                Value<bool> active = const Value.absent(),
              }) => BlacklistEntryCompanion.insert(
                id: id,
                name: name,
                category: category,
                aliases: aliases,
                programs: programs,
                status: status,
                reasonEncrypted: reasonEncrypted,
                sourceEncrypted: sourceEncrypted,
                dateAdded: dateAdded,
                lastReviewed: lastReviewed,
                reviewOwner: reviewOwner,
                notesEncrypted: notesEncrypted,
                active: active,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BlacklistEntryTable, BlacklistEntryData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $BlacklistEntryTable,
                    BlacklistEntryData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BlacklistEntryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BlacklistEntryTable,
      BlacklistEntryData,
      $$BlacklistEntryTableFilterComposer,
      $$BlacklistEntryTableOrderingComposer,
      $$BlacklistEntryTableAnnotationComposer,
      $$BlacklistEntryTableCreateCompanionBuilder,
      $$BlacklistEntryTableUpdateCompanionBuilder,
      (
        BlacklistEntryData,
        BaseReferences<_$AppDatabase, $BlacklistEntryTable, BlacklistEntryData>,
      ),
      BlacklistEntryData,
      PrefetchHooks Function()
    >;
typedef $$AuditLogEntryTableCreateCompanionBuilder =
    AuditLogEntryCompanion Function({
      Value<int> id,
      Value<String?> actor,
      required String action,
      required String entity,
      Value<int?> entityId,
      required DateTime timestamp,
      Value<String?> details,
    });
typedef $$AuditLogEntryTableUpdateCompanionBuilder =
    AuditLogEntryCompanion Function({
      Value<int> id,
      Value<String?> actor,
      Value<String> action,
      Value<String> entity,
      Value<int?> entityId,
      Value<DateTime> timestamp,
      Value<String?> details,
    });

class $$AuditLogEntryTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogEntryTable> {
  $$AuditLogEntryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actor => $composableBuilder(
    column: $table.actor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogEntryTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogEntryTable> {
  $$AuditLogEntryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actor => $composableBuilder(
    column: $table.actor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogEntryTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogEntryTable> {
  $$AuditLogEntryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actor =>
      $composableBuilder(column: $table.actor, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entity =>
      $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);
}

class $$AuditLogEntryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogEntryTable,
          AuditLogEntryData,
          $$AuditLogEntryTableFilterComposer,
          $$AuditLogEntryTableOrderingComposer,
          $$AuditLogEntryTableAnnotationComposer,
          $$AuditLogEntryTableCreateCompanionBuilder,
          $$AuditLogEntryTableUpdateCompanionBuilder,
          (
            AuditLogEntryData,
            BaseReferences<
              _$AppDatabase,
              $AuditLogEntryTable,
              AuditLogEntryData
            >,
          ),
          AuditLogEntryData,
          PrefetchHooks Function()
        > {
  $$AuditLogEntryTableTableManager(_$AppDatabase db, $AuditLogEntryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogEntryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogEntryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogEntryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> actor = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> entity = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String?> details = const Value.absent(),
              }) => AuditLogEntryCompanion(
                id: id,
                actor: actor,
                action: action,
                entity: entity,
                entityId: entityId,
                timestamp: timestamp,
                details: details,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> actor = const Value.absent(),
                required String action,
                required String entity,
                Value<int?> entityId = const Value.absent(),
                required DateTime timestamp,
                Value<String?> details = const Value.absent(),
              }) => AuditLogEntryCompanion.insert(
                id: id,
                actor: actor,
                action: action,
                entity: entity,
                entityId: entityId,
                timestamp: timestamp,
                details: details,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AuditLogEntryTable, AuditLogEntryData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $AuditLogEntryTable,
                    AuditLogEntryData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogEntryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogEntryTable,
      AuditLogEntryData,
      $$AuditLogEntryTableFilterComposer,
      $$AuditLogEntryTableOrderingComposer,
      $$AuditLogEntryTableAnnotationComposer,
      $$AuditLogEntryTableCreateCompanionBuilder,
      $$AuditLogEntryTableUpdateCompanionBuilder,
      (
        AuditLogEntryData,
        BaseReferences<_$AppDatabase, $AuditLogEntryTable, AuditLogEntryData>,
      ),
      AuditLogEntryData,
      PrefetchHooks Function()
    >;
typedef $$AppSettingTableCreateCompanionBuilder = AppSettingCompanion Function({
  required String key,
  Value<String?> value,
  Value<int> rowid,
});
typedef $$AppSettingTableUpdateCompanionBuilder = AppSettingCompanion Function({
  Value<String> key,
  Value<String?> value,
  Value<int> rowid,
});

class $$AppSettingTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingTable> {
  $$AppSettingTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingTable> {
  $$AppSettingTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingTable> {
  $$AppSettingTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingTable,
          AppSettingData,
          $$AppSettingTableFilterComposer,
          $$AppSettingTableOrderingComposer,
          $$AppSettingTableAnnotationComposer,
          $$AppSettingTableCreateCompanionBuilder,
          $$AppSettingTableUpdateCompanionBuilder,
          (
            AppSettingData,
            BaseReferences<_$AppDatabase, $AppSettingTable, AppSettingData>,
          ),
          AppSettingData,
          PrefetchHooks Function()
        > {
  $$AppSettingTableTableManager(_$AppDatabase db, $AppSettingTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String?> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => AppSettingCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                Value<String?> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingTable, AppSettingData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $AppSettingTable,
                    AppSettingData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingTable,
      AppSettingData,
      $$AppSettingTableFilterComposer,
      $$AppSettingTableOrderingComposer,
      $$AppSettingTableAnnotationComposer,
      $$AppSettingTableCreateCompanionBuilder,
      $$AppSettingTableUpdateCompanionBuilder,
      (
        AppSettingData,
        BaseReferences<_$AppDatabase, $AppSettingTable, AppSettingData>,
      ),
      AppSettingData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StaffTableTableManager get staff =>
      $$StaffTableTableManager(_db, _db.staff);
  $$ImportRecordTableTableManager get importRecord =>
      $$ImportRecordTableTableManager(_db, _db.importRecord);
  $$RotaAssignmentTableTableManager get rotaAssignment =>
      $$RotaAssignmentTableTableManager(_db, _db.rotaAssignment);
  $$DutyAssignmentTableTableManager get dutyAssignment =>
      $$DutyAssignmentTableTableManager(_db, _db.dutyAssignment);
  $$ShiftCodeTableTableManager get shiftCode =>
      $$ShiftCodeTableTableManager(_db, _db.shiftCode);
  $$ManualCategoryTableTableManager get manualCategory =>
      $$ManualCategoryTableTableManager(_db, _db.manualCategory);
  $$ManualDocumentTableTableManager get manualDocument =>
      $$ManualDocumentTableTableManager(_db, _db.manualDocument);
  $$SegContentCategoryRowTableTableManager get segContentCategoryRow =>
      $$SegContentCategoryRowTableTableManager(_db, _db.segContentCategoryRow);
  $$SegSpecialFileGroupRowTableTableManager get segSpecialFileGroupRow =>
      $$SegSpecialFileGroupRowTableTableManager(
        _db,
        _db.segSpecialFileGroupRow,
      );
  $$SegGlossaryRowTableTableManager get segGlossaryRow =>
      $$SegGlossaryRowTableTableManager(_db, _db.segGlossaryRow);
  $$ContactTableTableManager get contact =>
      $$ContactTableTableManager(_db, _db.contact);
  $$BlacklistEntryTableTableManager get blacklistEntry =>
      $$BlacklistEntryTableTableManager(_db, _db.blacklistEntry);
  $$AuditLogEntryTableTableManager get auditLogEntry =>
      $$AuditLogEntryTableTableManager(_db, _db.auditLogEntry);
  $$AppSettingTableTableManager get appSetting =>
      $$AppSettingTableTableManager(_db, _db.appSetting);
}
