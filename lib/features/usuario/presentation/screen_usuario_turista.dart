import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/core/theme/colors.dart';
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

  // VARIABLE CLAVE PARA RENDIMIENTO
  bool _mostrarContenido = false;

  @override
  void initState() {
    super.initState();
    cargarFoto();

    // TRUCO DE PROFESOR: Esperamos a que la transición termine para cargar lo pesado
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) setState(() => _mostrarContenido = true);
    });
  }

  void cargarFoto() async {
    final foto = await scripts.cargarFotoPerfil();
    if (mounted) {
      setState(() => imageUrl = foto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFB), // Un blanco azulado muy limpio
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false, // Alineado a la izquierda se ve más moderno
        title: const Text(
          'TURISGO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: kWhiteColor,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: kMainGradient, // Usamos tu gradiente Teal/Mint
          ),
        ),
        elevation: 0,
        actions: [_buildProfileAvatar()],
      ),
      body: !_mostrarContenido
          ? const Center(child: CircularProgressIndicator(color: kTealColor))
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(), // Scroll suave estilo iOS
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSearch(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle("Categorías"),
                        const CategoriasCarrusel(),
                        AppSpacing.h30,

                        _sectionTitle("Recomendado para ti"),
                        const CarruselInfinito(),
                        AppSpacing.h30,

                        _sectionTitle("Hoteles populares"),
                        HotelesCarrusel(),
                        AppSpacing.h30,

                        _sectionTitle("Restaurantes"),
                        RestaurantesCarrusel(),
                        AppSpacing.h40,
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // --- COMPONENTES VISUALES MEJORADOS ---

  Widget _buildProfileAvatar() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kWhiteColor, width: 2),
          ),
          child: GestureDetector(
            onTapDown: (details) => scripts.mostrarMenuPerfil(context, details),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: kCreamColor,
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : const NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/847/847969.png",
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSearch() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      decoration: const BoxDecoration(
        gradient: kMainGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        // Envolvemos en un Container para aplicar la sombra correctamente
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1), // Corrección aquí
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "¿A dónde quieres ir hoy?",
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: const Icon(Icons.search_rounded, color: kTealColor),
            filled: true,
            fillColor: Colors
                .transparent, // Transparente porque el fondo lo da el Container
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2D3142), // Un gris oscuro azulado muy elegante
        ),
      ),
    );
  }
}