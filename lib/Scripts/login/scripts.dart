import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/AuthServices.dart';

class ScriptsLogin {
  final _authService = AuthServices();
  final email = TextEditingController();
  final password = TextEditingController();
  final key = GlobalKey<FormState>();

  Future<String?> validar() async {
    // 1. Valida el estado interno del formulario (lógica de UI)
    if (!key.currentState!.validate()) {
      return 'Por favor, corrige los campos del formulario.';
    }

    // 2. LLAMADA AL SERVICIO: El código del servicio se ejecuta aquí
    final String? errorDelServicio = await _authService.signIn(
      email.text.trim(),
      password.text.trim(),
    );

    // 3. Retorna el resultado (error o null) a la Vista.
    return errorDelServicio;
  }

  void dispose() {
    email.dispose();
    password.dispose();
  }
}
