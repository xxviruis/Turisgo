import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDAO {
  final SupabaseClient client;

  AuthDAO(this.client);

  Future<void> signIn(String email, String password) async {
    await client.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  User? getCurrentUser() {
    return client.auth.currentUser;
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    return await client
        .from('perfiles')
        .select()
        .eq('id', userId)
        .maybeSingle();
  }

  // Nuevo: Enviar el correo de recuperación
  Future<void> sendResetPasswordEmail(String email) async {
    await client.auth.resetPasswordForEmail(email);
  }

  // Nuevo: Verificar el token de 6 dígitos
  Future<AuthResponse> verifyOTP(String email, String token) async {
    return await client.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.recovery,
    );
  }

  // Nuevo: Cambiar la contraseña (requiere sesión activa tras verifyOTP)
  Future<void> updateUserPassword(String newPassword) async {
    await client.auth.updateUser(UserAttributes(password: newPassword));
  }
}
