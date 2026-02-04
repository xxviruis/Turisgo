import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/pantalla_logout.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ignore: camel_case_types
class scriptsPantallaSecundaria {
  String? imageUrl;
  Future<String?> cargarFotoPerfil() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user != null) {
      final datos = await Supabase.instance.client
          .from("usuarios")
          .select("foto")
          .eq("id", user.id)
          .maybeSingle();

      return datos?["foto"];
    }
    return null;
  }

  Future<void> mostrarMenuPerfil(
    BuildContext context,
    TapDownDetails details,
  ) async {
    final dx = details.globalPosition.dx;
    final dy = details.globalPosition.dy;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(dx, dy + 10, 0, 0),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Editar perfil"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Ajustes"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),

        /// 🔥 CERRAR SESIÓN → ANIMACIÓN → PRINCIPAL
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Cerrar sesión",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () async {
              Navigator.pop(context);

              /// Mostrar animación mientras cierra sesión
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PantallaLogout()),
              );

              await Supabase.instance.client.auth.signOut();
            },
          ),
        ),
      ],
    );
  }
}
