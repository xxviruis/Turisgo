// features/auth/presentation/controllers/forgot_password_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

enum ForgotPasswordStatus { initial, loading, codeSent, success, error }

class ForgotPasswordController extends ChangeNotifier {
  final AuthRepository _repository;

  ForgotPasswordController(this._repository);

  ForgotPasswordStatus status = ForgotPasswordStatus.initial;
  String? errorMessage;

  /// Limpia el error y decide el estado previo
  void reset() {
    // Si estamos en error, volvemos a 'codeSent' para que el usuario
    // siga viendo el formulario del PIN pero sin el color rojo.
    if (status == ForgotPasswordStatus.error) {
      status = ForgotPasswordStatus.codeSent;
    } else {
      // Si no hay error, es que el usuario quiere volver al inicio (paso 1)
      status = ForgotPasswordStatus.initial;
    }
    errorMessage = null;
    notifyListeners();
  }

  // Paso 1: Enviar Email
  Future<void> sendCode(String email) async {
    _updateStatus(ForgotPasswordStatus.loading);
    try {
      await _repository.sendPasswordResetCode(email);
      _updateStatus(ForgotPasswordStatus.codeSent);
    } catch (e) {
      _handleError("No pudimos enviar el correo. Revisa tu conexión.");
    }
  }

  // Paso 2: Verificar y Cambiar
  Future<bool> verifyAndReset(
    String email,
    String code,
    String newPassword,
  ) async {
    _updateStatus(ForgotPasswordStatus.loading);
    try {
      await _repository.confirmPasswordReset(
        email: email,
        code: code,
        newPassword: newPassword,
      );
      _updateStatus(ForgotPasswordStatus.success);
      return true;
    } catch (e) {
      _handleError("Código incorrecto o expirado.");
      return false;
    }
  }

  void _updateStatus(ForgotPasswordStatus newStatus) {
    status = newStatus;
    errorMessage = null;
    notifyListeners();
  }

  void _handleError(String message) {
    errorMessage = message;
    status = ForgotPasswordStatus.error;
    notifyListeners();
  }
}
