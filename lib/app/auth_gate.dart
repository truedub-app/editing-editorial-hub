import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/pin_setup_screen.dart';
import '../features/auth/pin_unlock_screen.dart';
import '../services/auth_service.dart';

/// Wraps the whole app: shows PIN setup on first run, a PIN/biometric lock
/// screen otherwise, and only reveals [child] once unlocked.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    if (!auth.ready) {
      return const _LoadingScaffold();
    }
    if (!auth.hasPin) {
      return const PinSetupScreen();
    }
    if (!auth.isUnlocked) {
      return const PinUnlockScreen();
    }
    return child;
  }
}

class _LoadingScaffold extends StatelessWidget {
  const _LoadingScaffold();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
