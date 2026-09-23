import 'package:flutter/material.dart';

class NavItem {
  const NavItem({required this.label, required this.icon, required this.path});
  final String label;
  final IconData icon;
  final String path;
}

/// Primary destinations, shared by the desktop sidebar and mobile bottom
/// nav (spec section 2).
const primaryNavItems = [
  NavItem(label: 'Home', icon: Icons.dashboard_outlined, path: '/home'),
  NavItem(label: 'Shift ROTA', icon: Icons.calendar_month_outlined, path: '/rota'),
  NavItem(label: 'Work Manual', icon: Icons.menu_book_outlined, path: '/manual'),
  NavItem(label: 'Contacts', icon: Icons.contacts_outlined, path: '/contacts'),
  NavItem(label: 'Blacklist', icon: Icons.block_outlined, path: '/blacklist'),
];

const dataManagementNavItems = [
  NavItem(label: 'Import ROTA', icon: Icons.upload_file_outlined, path: '/settings/import-rota'),
  NavItem(label: 'Export Backup', icon: Icons.archive_outlined, path: '/settings/backup'),
  NavItem(label: 'Settings', icon: Icons.settings_outlined, path: '/settings'),
];
