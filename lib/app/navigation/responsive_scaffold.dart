import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import 'nav_items.dart';

const _wideBreakpoint = 900.0;

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({super.key, required this.child, required this.currentPath});

  final Widget child;
  final String currentPath;

  int _mobileIndexFor(String path) {
    if (path.startsWith('/rota')) return 1;
    if (path.startsWith('/manual')) return 2;
    if (path.startsWith('/contacts')) return 3;
    if (path.startsWith('/home')) return 0;
    return 4; // "More"
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isWide = constraints.maxWidth >= _wideBreakpoint;
      if (isWide) {
        return Scaffold(
          body: Row(
            children: [
              _Sidebar(currentPath: currentPath),
              const VerticalDivider(width: 1, color: AppColors.divider),
              Expanded(child: child),
            ],
          ),
        );
      }
      return Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _mobileIndexFor(currentPath),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: 'ROTA'),
            NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Manual'),
            NavigationDestination(icon: Icon(Icons.contacts_outlined), label: 'Contacts'),
            NavigationDestination(icon: Icon(Icons.more_horiz), label: 'More'),
          ],
          onDestinationSelected: (index) {
            switch (index) {
              case 0:
                context.go('/home');
              case 1:
                context.go('/rota');
              case 2:
                context.go('/manual');
              case 3:
                context.go('/contacts');
              default:
                context.go('/more');
            }
          },
        ),
      );
    });
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({required this.currentPath});
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Container(
        color: AppColors.card,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primaryBlue,
                    radius: 16,
                    child: Text('EE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Editing & Editorial Hub',
                      style: TextStyle(fontWeight: FontWeight.w600),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            for (final item in primaryNavItems) _SidebarTile(item: item, currentPath: currentPath),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Text('DATA MANAGEMENT',
                  style: TextStyle(fontSize: 11, color: AppColors.mutedText, letterSpacing: 0.6)),
            ),
            for (final item in dataManagementNavItems)
              _SidebarTile(item: item, currentPath: currentPath),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 8, color: AppColors.qc2Green),
                  SizedBox(width: 6),
                  Text('Local data', style: TextStyle(fontSize: 12, color: AppColors.mutedText)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({required this.item, required this.currentPath});
  final NavItem item;
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    final selected = currentPath.startsWith(item.path);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.go(item.path),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppColors.primaryBlue.withValues(alpha: 0.16) : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(item.icon, size: 20, color: selected ? AppColors.primaryBlue : AppColors.mutedText),
              const SizedBox(width: 12),
              Text(
                item.label,
                style: TextStyle(
                  color: selected ? AppColors.primaryBlue : AppColors.text,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
