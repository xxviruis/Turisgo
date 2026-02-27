import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/core/theme/colors.dart'; // 🔹 Agregamos tus colores
import 'package:flutter_application_1/features/auth/presentation/screens/login.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/register.dart';
import 'package:flutter_application_1/features/principal/principal_screens/carrusel_Infinito.dart';
import 'package:flutter_application_1/features/principal/principal_screens/categorias_carrusel.dart';
import 'package:flutter_application_1/features/principal/principal_screens/ciudades_carrusel.dart';
import 'package:flutter_application_1/features/principal/principal_screens/hotel_carrusel.dart';
import 'package:flutter_application_1/features/principal/principal_screens/motel_carrusel.dart';
import 'package:flutter_application_1/features/principal/principal_screens/paquetes_carrusel.dart';
import 'package:flutter_application_1/features/principal/principal_screens/restaurante_carrusel.dart';
import 'package:flutter_application_1/l10n/generated/app_localizations.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _ciudadesKey = GlobalKey();
  final GlobalKey _paquetesKey = GlobalKey();
  final GlobalKey _hotelesKey = GlobalKey();
  final GlobalKey _restaurantesKey = GlobalKey();
  final GlobalKey _motelesKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600), // Un poco más suave
        curve: Curves.easeOutCubic, // Curva más natural
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFB), // Fondo limpio y moderno
      appBar: AppBar(
        toolbarHeight: 160, // 👈 AppBar pequeño
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,

        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kMainGradient),
          child: Stack(
            clipBehavior: Clip.none, // 🔥 permite que el logo sobresalga
            children: [
              // LOGO GRANDE
              Positioned(
                left: 635,
                top: -20,
                bottom: -35, // 👈 hace que el logo sobresalga
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 230, // 👈 logo grande
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
        ),
        actions: [
          // Botón Secundario (Iniciar Sesión)
          _buildAppBarButton(
            text: l10n.iniciarSesion,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Login()),
            ),
            isPrimary: false,
          ),
          // Botón Primario (Registrarse) - Resalta más
          _buildAppBarButton(
            text: l10n.registrarse,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Registrarse()),
            ),
            isPrimary: true,
          ),
          const SizedBox(width: 8), // Margen final
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics:
            const BouncingScrollPhysics(), // Da ese rebote elástico premium
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 HEADER CON BUSCADOR (Consistente con la otra pantalla)
            _buildHeaderSearch(l10n.dondeQuieresIr),

            // 🔹 CONTENIDO PRINCIPAL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.h25,
                  _sectionTitle(l10n.categorias),
                  AppSpacing.h10,
                  CategoriasCarrusel(
                    onCiudades: () => _scrollTo(_ciudadesKey),
                    onPaquetes: () => _scrollTo(_paquetesKey),
                    onHoteles: () => _scrollTo(_hotelesKey),
                    onRestaurantes: () => _scrollTo(_restaurantesKey),
                    onMoteles: () => _scrollTo(_motelesKey),
                  ),

                  AppSpacing.h30,
                  _sectionTitle(l10n.recomendadoParaTi),
                  AppSpacing.h10,
                  const CarruselInfinito(),

                  // Carruseles de categorías con sus llaves de anclaje
                  _sectionSpacer(_ciudadesKey, const CiudadesCarrusel()),
                  _sectionSpacer(_paquetesKey, PaquetesCarrusel()),
                  _sectionSpacer(_hotelesKey, HotelesCarrusel()),
                  _sectionSpacer(_restaurantesKey, RestaurantesCarrusel()),
                  _sectionSpacer(_motelesKey, MotelesCarrusel()),

                  AppSpacing.h50,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS VISUALES EXTRAÍDOS ---

  /// Botón superior con jerarquía visual
  Widget _buildAppBarButton({
    required String text,
    required VoidCallback onPressed,
    required bool isPrimary,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isPrimary ? kPeachColor : kTealColor,
          side: isPrimary ? BorderSide.none : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 13,
            fontWeight: isPrimary ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// Buscador integrado al diseño (Header)
  Widget _buildHeaderSearch(String hintText) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      decoration: const BoxDecoration(
        gradient: kMainGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: const Icon(Icons.search_rounded, color: kTealColor),
            filled: true,
            fillColor: Colors.transparent,
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

  /// Títulos de sección consistentes
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2D3142), // Gris oscuro azulado, mejor que negro puro
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _sectionSpacer(GlobalKey key, Widget child) {
    return Column(
      children: [
        AppSpacing.h30,
        Container(key: key, child: child),
      ],
    );
  }
}
