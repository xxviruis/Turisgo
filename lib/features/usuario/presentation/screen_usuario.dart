import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/features/principal/principal_screens/carrusel_Infinito.dart';
import 'package:flutter_application_1/features/principal/principal_screens/categorias_carrusel.dart';
import 'package:flutter_application_1/features/principal/principal_screens/hotel_carrusel.dart';
import 'package:flutter_application_1/features/principal/principal_screens/restaurante_carrusel.dart';
import 'package:flutter_application_1/features/usuario/domain/usecases/usuario_logic/scripts.dart';

class PantallaHomeAutenticada extends StatefulWidget {
  const PantallaHomeAutenticada({super.key});

  @override
  State<PantallaHomeAutenticada> createState() => _PantallaHomeAutenticada();
}

class _PantallaHomeAutenticada extends State<PantallaHomeAutenticada> {
  String? imageUrl;
  final scripts = scriptsPantallaSecundaria();

  @override
  void initState() {
    super.initState();
    cargarFoto();
  }

  void cargarFoto() async {
    final foto = await scripts.cargarFotoPerfil();
    if (mounted) {
      setState(() {
        imageUrl = foto;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      /// ------------------ APPBAR --------------------
      appBar: AppBar(
        automaticallyImplyLeading: false, // 🔥 QUITA LA FLECHA
        title: const Text('TURISGO'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTapDown: (details) =>
                  scripts.mostrarMenuPerfil(context, details),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                backgroundImage: imageUrl != null
                    ? NetworkImage(imageUrl!)
                    : const NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/847/847969.png",
                      ),
              ),
            ),
          ),
        ],
      ),

      /// ------------------ CUERPO --------------------
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h16,

              /// BUSCADOR
              TextField(
                decoration: InputDecoration(
                  hintText: "¿A dónde quieres ir?",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              AppSpacing.h25,

              /// CATEGORÍAS
              const Text(
                "Categorías",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              AppSpacing.h10,
              const CategoriasCarrusel(),
              AppSpacing.h30,

              /// RECOMENDACIONES
              const Text(
                "Recomendado para ti",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              AppSpacing.h10,
              const CarruselInfinito(),
              AppSpacing.h30,

              /// HOTELES
              const Text(
                "Hoteles populares",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              AppSpacing.h10,
              HotelesCarrusel(),
              AppSpacing.h30,

              /// RESTAURANTES
              const Text(
                "Restaurantes recomendados",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              AppSpacing.h10,
              RestaurantesCarrusel(),
              AppSpacing.h40,
            ],
          ),
        ),
      ),
    );
  }
}
