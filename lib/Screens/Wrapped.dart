import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/pantalla_home_autenticada.dart';
import 'package:flutter_application_1/Screens/PrincipalScreens/principal.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Asumiendo que has definido 'final supabase = Supabase.instance.client;'

// Importa tus pantallas

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Escucha los cambios en el estado de autenticación de Supabase.
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,

      builder: (context, snapshot) {
        // --- Manejo de la Conexión ---
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se carga la sesión inicial.
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // --- Manejo del Estado de Autenticación ---
        final AuthState? authState = snapshot.data;

        // Comprobamos si la sesión es nula.
        // Si session es null, o si la sesión existe pero el evento es SIGNED_OUT,
        // consideramos que el usuario no está autenticado.
        if (authState == null || authState.session == null) {
          // El usuario NO está logueado.
          return const PantallaPrincipal();
        } else {
          // El usuario SÍ está logueado (session no es nula).
          return const PantallaHomeAutenticada();
        }
      },
    );
  }
}
