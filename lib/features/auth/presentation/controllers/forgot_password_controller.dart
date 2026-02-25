import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/verify_otp_usecase.dart';

enum ForgotStatus { initial, loading, codeSent, success, error }

class ForgotPasswordController extends ChangeNotifier {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  ForgotPasswordController({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
  });

  static const int _cooldownDuration = 60;

  ForgotStatus status = ForgotStatus.initial;
  String? errorMessage;
  int cooldownSeconds = 0;

  Timer? _cooldownTimer;

  bool get isLoading => status == ForgotStatus.loading;
  bool get isCodeSent => status == ForgotStatus.codeSent;
  bool get isCooldownActive => cooldownSeconds > 0;

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  Future<void> sendCode(String email) async {
    if (!_isValidEmail(email)) {
      _setError("Por favor, ingresa un correo válido.");
      return;
    }

    try {
      _setStatus(ForgotStatus.loading);
      await sendOtpUseCase(email);
      _setStatus(ForgotStatus.codeSent);
      _startCooldown();
    } catch (e) {
      _setError(_parseError(e));
    }
  }

  Future<void> verifyAndReset({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      _setStatus(ForgotStatus.loading);
      await verifyOtpUseCase(
        email: email,
        code: code,
        newPassword: newPassword,
      );
      _setStatus(ForgotStatus.success);
    } catch (e) {
      _setError(_parseError(e));
    }
  }

  void reset() {
    _cooldownTimer?.cancel();
    cooldownSeconds = 0;
    errorMessage = null;
    _setStatus(ForgotStatus.initial);
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  void _setStatus(ForgotStatus newStatus) {
    status = newStatus;
    notifyListeners();
  }

  void _setError(String message) {
    errorMessage = message;
    _setStatus(ForgotStatus.error);
  }

  void _startCooldown() {
    cooldownSeconds = _cooldownDuration;
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (cooldownSeconds > 0) {
        cooldownSeconds--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  bool _isValidEmail(String email) => email.isNotEmpty && email.contains('@');

  String _parseError(Object e) => e.toString().replaceAll('Exception: ', '');
}
