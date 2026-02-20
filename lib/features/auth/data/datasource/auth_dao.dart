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
}
