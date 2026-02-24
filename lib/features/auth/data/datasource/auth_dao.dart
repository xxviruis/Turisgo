import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDAO {
  const AuthDAO(this.client);

  final SupabaseClient client;

  Future<void> signIn(String email, String password) async {
    await client.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  User? getCurrentUser() => client.auth.currentUser;

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    return client.from('perfiles').select().eq('id', userId).maybeSingle();
  }

  /// Envía un OTP al correo sin crear un usuario nuevo.
  Future<void> sendOtp(String email) async {
    await client.auth.signInWithOtp(email: email, shouldCreateUser: false);
  }

  /// Verifica el OTP usando tipo [OtpType.email] (no recovery).
  Future<AuthResponse> verifyOtp(String email, String token) async {
    return client.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.email,
    );
  }

  Future<void> updateUserPassword(String newPassword) async {
    await client.auth.updateUser(UserAttributes(password: newPassword));
  }
}
