import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/admin/presentation/admin_screens/admin_dashboard.dart';
import 'package:flutter_application_1/features/principal/principal_screens/principal.dart';
import 'package:flutter_application_1/features/usuario/presentation/screen_usuario.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Importa tus pantallas reales

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // 1. Manejo de carga inicial de la sesión
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final session = snapshot.data?.session;

        // 2. Si no hay sesión, mandamos a la pantalla principal (Login/Bienvenida)
        if (session == null) {
          return const PantallaPrincipal();
        }

        // 3. ¡SESIÓN DETECTADA! Ahora verificamos el ROL en la tabla 'perfiles'
        return FutureBuilder<Map<String, dynamic>?>(
          // Consultamos la tabla 'perfiles' usando el ID del usuario actual
          future: supabase
              .from('perfiles')
              .select('rol')
              .eq('id', session.user.id)
              .maybeSingle(), // Usamos maybeSingle por seguridad
          builder: (context, rolSnapshot) {
            // Mientras consulta la base de datos
            if (rolSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            // Si hay un error o no se encuentra el perfil, por defecto mandamos a usuario normal
            if (rolSnapshot.hasError || rolSnapshot.data == null) {
              return const PantallaHomeAutenticada();
            }

            final String rol = rolSnapshot.data!['rol'] ?? 'user';

            // 4. REDIRECCIÓN SEGÚN ROL (SOLID: Lógica de negocio clara)
            if (rol == 'admin') {
              return const AdminDashboard(); // Pantalla de Admin que creamos
            } else {
              return const PantallaHomeAutenticada(); // Pantalla de Usuario normal
            }
          },
        );
      },
    );
  }
}
