class BackupManifest {
  BackupManifest({required this.exportedAt, required this.dataVersion, required this.counts});

  final DateTime exportedAt;
  final int dataVersion;
  final Map<String, int> counts;

  Map<String, dynamic> toJson() => {
        'exportedAt': exportedAt.toIso8601String(),
        'dataVersion': dataVersion,
        'counts': counts,
      };

  static BackupManifest fromJson(Map<String, dynamic> json) => BackupManifest(
        exportedAt: DateTime.parse(json['exportedAt'] as String),
        dataVersion: json['dataVersion'] as int,
        counts: Map<String, int>.from(json['counts'] as Map),
      );
}
