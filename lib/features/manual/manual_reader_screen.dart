import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/manual_repository.dart';

class ManualReaderScreen extends StatefulWidget {
  const ManualReaderScreen({super.key, required this.documentId});
  final int documentId;

  @override
  State<ManualReaderScreen> createState() => _ManualReaderScreenState();
}

class _ManualReaderScreenState extends State<ManualReaderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ManualRepository>().markOpened(widget.documentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final repo = context.read<ManualRepository>();
    return StreamBuilder<List<ManualDocumentData>>(
      stream: repo.watchDocuments(),
      builder: (context, snapshot) {
        final matches = (snapshot.data ?? []).where((d) => d.id == widget.documentId);
        final doc = matches.isEmpty ? null : matches.first;
        if (doc == null) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(doc.title),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: Row(
                  children: [
                    if (doc.reference != null)
                      Text('${doc.reference} ${doc.version ?? ''}'.trim(),
                          style: const TextStyle(color: AppColors.mutedText)),
                  ],
                ),
              ),
              Expanded(child: _buildViewer(doc)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildViewer(ManualDocumentData doc) {
    switch (doc.fileType) {
      case 'pdf':
        return _PdfSection(doc: doc);
      case 'video':
        return _VideoSection(doc: doc);
      default:
        return _ProcedureSection(doc: doc);
    }
  }
}

class _ProcedureSection extends StatelessWidget {
  const _ProcedureSection({required this.doc});
  final ManualDocumentData doc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (doc.description != null) ...[
            Text(doc.description!, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
          ],
          SelectableText(
            doc.bodyText ?? 'No procedure text has been added yet. Use Import Documents in '
                'Settings to attach the full procedure.',
            style: const TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _PdfSection extends StatefulWidget {
  const _PdfSection({required this.doc});
  final ManualDocumentData doc;

  @override
  State<_PdfSection> createState() => _PdfSectionState();
}

class _PdfSectionState extends State<_PdfSection> {
  PdfController? _controller;

  @override
  void initState() {
    super.initState();
    final path = widget.doc.localFilePath;
    if (path != null) {
      _controller = PdfController(document: PdfDocument.openFile(path));
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return _NotYetImported(
        doc: widget.doc,
        message: 'The original PDF has not been imported to this device yet.',
      );
    }
    return Column(
      children: [
        Expanded(child: PdfView(controller: _controller!)),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(widget.doc.bodyText ?? '', style: const TextStyle(color: AppColors.mutedText)),
        ),
      ],
    );
  }
}

class _VideoSection extends StatefulWidget {
  const _VideoSection({required this.doc});
  final ManualDocumentData doc;

  @override
  State<_VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<_VideoSection> {
  Player? _player;
  VideoController? _videoController;
  double _speed = 1.0;

  @override
  void initState() {
    super.initState();
    final path = widget.doc.localFilePath;
    if (path != null) {
      _player = Player();
      _videoController = VideoController(_player!);
      _player!.open(Media(path));
    }
  }

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_player == null) {
      return _NotYetImported(
        doc: widget.doc,
        message: 'The original video has not been imported to this device yet.',
      );
    }
    return Column(
      children: [
        Expanded(child: Video(controller: _videoController!)),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const Text('Speed:'),
              const SizedBox(width: 8),
              DropdownButton<double>(
                value: _speed,
                items: const [0.75, 1.0, 1.25, 1.5, 2.0]
                    .map((s) => DropdownMenuItem(value: s, child: Text('${s}x')))
                    .toList(),
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _speed = v);
                  _player!.setRate(v);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotYetImported extends StatelessWidget {
  const _NotYetImported({required this.doc, required this.message});
  final ManualDocumentData doc;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardElevated,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.warningOrange),
                const SizedBox(width: 12),
                Expanded(child: Text(message)),
              ],
            ),
          ),
          if (doc.description != null) ...[
            const SizedBox(height: 16),
            Text(doc.description!, style: Theme.of(context).textTheme.bodyLarge),
          ],
          if (doc.bodyText != null) ...[
            const SizedBox(height: 16),
            SelectableText(doc.bodyText!, style: const TextStyle(height: 1.5)),
          ],
        ],
      ),
    );
  }
}
