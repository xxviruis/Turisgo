// services/profile_repository.dart

import 'package:supabase_flutter/supabase_flutter.dart';

final _supabase = Supabase.instance.client;

class ProfileRepository {
  // ... (getAvatarUrl se mantiene) ...

  // GUARDA EL PERFIL EN BD (Extraído y mejorado de ScriptsRegistrarse)
  Future<void> saveProfile({
    required String userEmail,
    required String rolSeleccionado,
    String? phone,
  }) async {
    // Mapeo del rol (Lógica de Negocio)
    final rolBD = rolSeleccionado == 'Turista' ? 'turista' : 'prestador';

    // El ID del usuario se obtiene de la sesión activa,
    // pero para este método necesitamos que el User object ya esté disponible.
    // Usaremos el email como dato de seguridad para el upsert.

    // NOTA: Para un upsert seguro, es mejor usar el ID del usuario.
    // Asumiremos que el usuario ya está autenticado después del signUp.
    final user = _supabase.auth.currentUser;
    if (user == null) {
      throw Exception("Usuario no autenticado para guardar perfil.");
    }

    await _supabase.from('perfiles').upsert({
      'id': user.id, // Usar el ID es más seguro que el email
      'email': userEmail.toLowerCase(),
      'rol': rolBD,
      'celular': phone,
    });
  }
}
