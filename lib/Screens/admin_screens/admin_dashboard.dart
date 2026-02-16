import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el ancho de la pantalla para cálculos rápidos
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Fondo gris suave de la imagen
      appBar: AppBar(
        title: const Text(
          'Panel de Control',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.indigo.withOpacity(0.1),
            child: const Icon(Icons.person, color: Colors.indigo),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Decidimos cuántas columnas mostrar según el ancho
          int crossAxisCount = constraints.maxWidth > 900
              ? 4
              : (constraints.maxWidth > 600 ? 3 : 2);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "¡Bienvenido, Admin!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1C1E),
                  ),
                ),
                const Text(
                  "Tu centro de comando para Turisgo.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // Grid Responsivo
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1, // Controla la forma de las tarjetas
                  children: [
                    _buildAdminCard(
                      context,
                      title: "Negocios",
                      icon: Icons.storefront_rounded,
                      color: Colors.blue,
                      route: '/admin/negocios',
                    ),
                    _buildAdminCard(
                      context,
                      title: "Usuarios",
                      icon: Icons.people_alt_rounded,
                      color: Colors.orange,
                      route: '/admin/usuarios',
                    ),
                    _buildAdminCard(
                      context,
                      title: "Reportes",
                      icon: Icons.analytics_rounded,
                      color: Colors.purple,
                      route: '/admin/reportes',
                    ),
                    _buildAdminCard(
                      context,
                      title: "Ajustes",
                      icon: Icons.settings_suggest_rounded,
                      color: Colors.teal,
                      route: '/admin/ajustes',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAdminCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return InkWell(
      onTap: () =>
          context.go(route), // Usamos GoRouter para navegar sin flechas
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF1A1C1E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
