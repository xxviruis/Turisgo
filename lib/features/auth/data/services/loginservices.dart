import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ScriptsRegistrarse {
  final key = GlobalKey<FormState>();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtConfirmPassword = TextEditingController();
  final txtPhone = TextEditingController();

  String? rolSeleccionado;
  final List<String> roles = ['Turista', 'Prestador de servicios'];

  // -------- VALIDACIONES ---------
  // (Sin cambios aquí)
  String? gmailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa tu correo Gmail';
    final gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    if (!gmailRegex.hasMatch(value.trim())) {
      return 'Solo se permiten correos @gmail.com';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'La contraseña es requerida';
    if (value.length < 6) return 'Mínimo 6 caracteres';
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Debe tener al menos una minúscula';
    }
    if (!RegExp(r'\d').hasMatch(value)) return 'Debe tener al menos un número';
    return null;
  }

  /// REGISTRO → devuelve un mensaje o null si todo salió bien
  Future<String?> registrar() async {
    if (!key.currentState!.validate()) return 'Hay campos inválidos';

    if (txtPassword.text != txtConfirmPassword.text) {
      return 'Las contraseñas no coinciden';
    }

    // Normalización de variables
    final String rolParaTrigger = (rolSeleccionado == 'Prestador de servicios')
        ? 'prestador'
        : 'turista';
    final celularParaTrigger = txtPhone.text.trim().isEmpty
        ? null
        : txtPhone.text.trim();

    try {
      // 1. Intento de registro
      // Nota: El método signUp retorna un AuthResponse que podemos usar
      final AuthResponse response = await Supabase.instance.client.auth.signUp(
        email: txtEmail.text.trim(),
        password: txtPassword.text.trim(),
        // Usar el URL de redirección solo si es necesario, pero no interfiere
        emailRedirectTo: "http://localhost:58892/#/auth",
        data: {'rol': rolParaTrigger, 'celular': celularParaTrigger},
      );

      // 2. Comprobar si Supabase creó un usuario, independientemente de la confirmación
      if (response.user != null) {
        // Registro exitoso, pero el usuario debe confirmar el email.
        // No manejamos el caso de usuario existente aquí, confiamos en el `catch`.
        return null; // Indica que el proceso de registro ha comenzado (ir a AwaitConfirm)
      }

      // Si llegamos aquí y no hubo excepción ni usuario, algo salió mal (caso poco probable)
      return 'El registro no se completó. Inténtalo de nuevo.';
    } on AuthException catch (e) {
      // 3. Manejo de AuthException (Supabase Lanza la excepción si el correo existe)
      final mensajeError = e.message.toLowerCase();

      if (mensajeError.contains('registered') ||
          mensajeError.contains('exists') ||
          mensajeError.contains('already has an account')) {
        // Este es el mensaje limpio que queremos mostrar al usuario
        return 'Este correo ya está en uso. Por favor, usa el formulario de inicio de sesión.';
      }

      // Para otros errores de autenticación (ej: contraseña débil)
      return 'Error de autenticación: ${e.message}';
    } catch (e) {
      // 4. Manejo de cualquier otra excepción (ej: error de red)
      return 'Error inesperado: $e';
    }
  }

  /// VERIFICA SI EL EMAIL YA ESTÁ CONFIRMADO (Sin cambios)
  Future<bool> emailConfirmado() async {
    await Supabase.instance.client.auth.refreshSession();
    final user = Supabase.instance.client.auth.currentUser;

    return user != null && user.emailConfirmedAt != null;
  }

  /// GUARDA EL PERFIL EN BD (Sin cambios y no se usa en el registro inicial)
  Future<void> guardarPerfil() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    final rolBD = rolSeleccionado == 'Turista' ? 'turista' : 'prestador';

    await Supabase.instance.client.from('perfiles').upsert({
      'id': user.id,
      'email': user.email!.toLowerCase(),
      'rol_id': rolBD,
      'celular': txtPhone.text.trim().isEmpty ? null : txtPhone.text.trim(),
    });
  }

  /// Limpieza
  void dispose() {
    txtEmail.dispose();
    txtPassword.dispose();
    txtConfirmPassword.dispose();
    txtPhone.dispose();
  }
}
