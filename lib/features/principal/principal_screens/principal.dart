import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
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
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 OBTENER TRADUCCIONES
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'TURISGO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          _buildAppBarButton(
            text: l10n.registrarse, // 🔹 TRADUCIDO
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Registrarse()),
            ),
          ),
          _buildAppBarButton(
            text: l10n.iniciarSesion, // 🔹 TRADUCIDO
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Login()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Buscador
              TextField(
                decoration: InputDecoration(
                  hintText: l10n.dondeQuieresIr, // 🔹 TRADUCIDO
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              AppSpacing.h25,
              Text(
                l10n.categorias, // 🔹 TRADUCIDO
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              AppSpacing.h10,
              CategoriasCarrusel(
                onCiudades: () => _scrollTo(_ciudadesKey),
                onPaquetes: () => _scrollTo(_paquetesKey),
                onHoteles: () => _scrollTo(_hotelesKey),
                onRestaurantes: () => _scrollTo(_restaurantesKey),
                onMoteles: () => _scrollTo(_motelesKey),
              ),
              AppSpacing.h30,
              Text(
                l10n.recomendadoParaTi, // 🔹 TRADUCIDO
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.h10,
              const CarruselInfinito(),

              // Carruseles de categorías (se mantienen con sus llaves)
              _sectionSpacer(_ciudadesKey, CiudadesCarrusel()),
              _sectionSpacer(_paquetesKey, PaquetesCarrusel()),
              _sectionSpacer(_hotelesKey, HotelesCarrusel()),
              _sectionSpacer(_restaurantesKey, RestaurantesCarrusel()),
              _sectionSpacer(_motelesKey, MotelesCarrusel()),

              AppSpacing.h50,
            ],
          ),
        ),
      ),
    );
  }

  // 🏛️ SOLID: Extraemos widgets repetitivos para limpiar el build
  Widget _buildAppBarButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
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
