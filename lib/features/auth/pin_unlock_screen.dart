import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../services/auth_service.dart';

class PinUnlockScreen extends StatefulWidget {
  const PinUnlockScreen({super.key});

  @override
  State<PinUnlockScreen> createState() => _PinUnlockScreenState();
}

class _PinUnlockScreenState extends State<PinUnlockScreen> {
  final _pinController = TextEditingController();
  String? _error;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _tryBiometric());
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _tryBiometric() async {
    final auth = context.read<AuthService>();
    if (await auth.biometricAvailable) {
      await auth.unlockWithBiometrics();
    }
  }

  Future<void> _submitPin() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    final ok = await context.read<AuthService>().unlockWithPin(_pinController.text.trim());
    if (!mounted) return;
    setState(() {
      _busy = false;
      if (!ok) {
        _error = 'Incorrect PIN.';
        _pinController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.lock_outline, size: 56, color: AppColors.primaryBlue),
                const SizedBox(height: 16),
                Text('Editing & Editorial Hub', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 4),
                const Text('Local mode · enter your PIN to continue',
                    style: TextStyle(color: AppColors.mutedText)),
                const SizedBox(height: 24),
                TextField(
                  controller: _pinController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: 'PIN'),
                  onSubmitted: (_) => _submitPin(),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 12),
                  Text(_error!, style: const TextStyle(color: AppColors.errorRed)),
                ],
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _busy ? null : _submitPin,
                  child: _busy
                      ? const SizedBox(
                          width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Unlock'),
                ),
                const SizedBox(height: 12),
                FutureBuilder<bool>(
                  future: auth.biometricAvailable,
                  builder: (context, snapshot) {
                    if (snapshot.data != true) return const SizedBox.shrink();
                    return TextButton.icon(
                      onPressed: _tryBiometric,
                      icon: const Icon(Icons.fingerprint),
                      label: const Text('Use biometric unlock'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
