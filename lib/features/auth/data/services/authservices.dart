import 'package:supabase_flutter/supabase_flutter.dart';

final _supabase = Supabase.instance.client;

class AuthServices {
  // ... (signIn y signOut se mantienen) ...
  Future<String?> signIn(String email, String password) async {
    try {
      await _supabase.auth.signInWithPassword(email: email, password: password);
      return null; // El inicio de sesión fue exitoso
    } on AuthException catch (error) {
      // Retorna el mensaje de error específico de Supabase
      return error.message;
    } catch (error) {
      // Retorna cualquier otro error
      return 'Ocurrió un error de red o inesperado: ${error.toString()}';
    }
  }
}

// MÉTODO PARA REGISTRAR (Extraído de ScriptsRegistrarse)
Future<User?> signUp({required String email, required String password}) async {
  // La lógica de Supabase se centraliza aquí
  final response = await _supabase.auth.signUp(
    email: email,
    password: password,
    // Mantenemos el emailRedirectTo si es necesario para tu flujo de confirmación
    emailRedirectTo: "http://localhost:58892/#/auth",
  );
  return response.user;
}

// VERIFICACIÓN DE EMAIL (Extraído de ScriptsRegistrarse)
Future<bool> isEmailConfirmed() async {
  // Refrescar la sesión para obtener el estado más reciente
  await _supabase.auth.refreshSession();
  final user = _supabase.auth.currentUser;

  return user != null && user.emailConfirmedAt != null;
}
