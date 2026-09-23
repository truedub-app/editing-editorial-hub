import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/contacts_repository.dart';
import '../../widgets/initials_avatar.dart';

const _teams = [
  'Editing & Editorial',
  'TV Services',
  'Acquisition',
  'Scheduling',
  'Tech Ops',
  'Transmission',
  'Graphics',
  'Compliance',
  'Production',
  'Other',
];

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  String? _team;
  bool _favoritesOnly = false;
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final repo = context.read<ContactsRepository>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: Icon(_favoritesOnly ? Icons.star : Icons.star_border),
            onPressed: () => setState(() => _favoritesOnly = !_favoritesOnly),
            tooltip: 'Favorites only',
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
                hintText: 'Search name, job title, team, channel, extension, email',
                isDense: true,
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: const Text('All teams'),
                    selected: _team == null,
                    onSelected: (_) => setState(() => _team = null),
                  ),
                ),
                for (final t in _teams)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(t),
                      selected: _team == t,
                      onSelected: (_) => setState(() => _team = t),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<ContactData>>(
              stream: repo.watchAll(team: _team, favoritesOnly: _favoritesOnly),
              builder: (context, snapshot) {
                var contacts = snapshot.data ?? [];
                if (_search.isNotEmpty) {
                  final q = _search.toLowerCase();
                  contacts = contacts.where((c) {
                    return c.name.toLowerCase().contains(q) ||
                        (c.jobTitle?.toLowerCase().contains(q) ?? false) ||
                        c.team.toLowerCase().contains(q) ||
                        (c.channels?.toLowerCase().contains(q) ?? false) ||
                        (c.areas?.toLowerCase().contains(q) ?? false) ||
                        (c.extension?.toLowerCase().contains(q) ?? false) ||
                        (c.email?.toLowerCase().contains(q) ?? false);
                  }).toList();
                }
                if (contacts.isEmpty) {
                  return const Center(
                    child: Text('No contacts found.\nTry another keyword or team.',
                        textAlign: TextAlign.center, style: TextStyle(color: AppColors.mutedText)),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: contacts.length,
                  itemBuilder: (context, i) => _ContactCard(contact: contacts[i]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddContactDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddContactDialog(BuildContext context) async {
    final nameCtrl = TextEditingController();
    final titleCtrl = TextEditingController();
    final extCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    var team = _team ?? _teams.first;
    final repo = context.read<ContactsRepository>();

    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add contact'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
                TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Job title')),
                DropdownButtonFormField<String>(
                  initialValue: team,
                  decoration: const InputDecoration(labelText: 'Team'),
                  items: _teams.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                  onChanged: (v) => setDialogState(() => team = v ?? team),
                ),
                TextField(controller: extCtrl, decoration: const InputDecoration(labelText: 'Extension')),
                TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            FilledButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                await repo.createContact(
                  name: nameCtrl.text.trim(),
                  team: team,
                  jobTitle: titleCtrl.text.trim().isEmpty ? null : titleCtrl.text.trim(),
                  extension: extCtrl.text.trim().isEmpty ? null : extCtrl.text.trim(),
                  email: emailCtrl.text.trim().isEmpty ? null : emailCtrl.text.trim(),
                );
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.contact});
  final ContactData contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InitialsAvatar(initials: _initials(contact.name)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contact.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  if (contact.jobTitle != null)
                    Text(contact.jobTitle!, style: const TextStyle(color: AppColors.mutedText, fontSize: 13)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        label: Text(contact.team, style: const TextStyle(fontSize: 11)),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      if (contact.channels != null)
                        Text(contact.channels!, style: const TextStyle(fontSize: 12, color: AppColors.mutedText)),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(contact.favorite ? Icons.star : Icons.star_border,
                      color: contact.favorite ? AppColors.inChargeYellow : AppColors.mutedText),
                  onPressed: () =>
                      context.read<ContactsRepository>().setFavorite(contact.id, !contact.favorite),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (contact.extension != null)
                      IconButton(
                        icon: const Icon(Icons.call_outlined, size: 20),
                        onPressed: () => launchUrl(Uri(scheme: 'tel', path: contact.extension)),
                      ),
                    if (contact.email != null)
                      IconButton(
                        icon: const Icon(Icons.email_outlined, size: 20),
                        onPressed: () => launchUrl(Uri(scheme: 'mailto', path: contact.email)),
                      ),
                    IconButton(
                      icon: const Icon(Icons.share_outlined, size: 20),
                      onPressed: () => SharePlus.instance.share(ShareParams(
                        text: '${contact.name}\n${contact.jobTitle ?? ''}\n'
                            '${contact.team}\nExt: ${contact.extension ?? '-'}\nEmail: ${contact.email ?? '-'}',
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }
}
