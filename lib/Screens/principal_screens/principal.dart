import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login/login_register_screens/login.dart';
import 'package:flutter_application_1/Screens/Login/login_register_screens/register.dart';
import 'package:flutter_application_1/Screens/principal_screens/carrusel_Infinito.dart';
import 'package:flutter_application_1/Screens/principal_screens/categorias_carrusel.dart';
import 'package:flutter_application_1/Screens/principal_screens/hotel_carrusel.dart';
import 'package:flutter_application_1/Screens/principal_screens/restaurante_carrusel.dart';
import 'package:flutter_application_1/Screens/principal_screens/ciudades_carrusel.dart';
import 'package:flutter_application_1/Screens/principal_screens/paquetes_carrusel.dart';
import 'package:flutter_application_1/Screens/principal_screens/motel_carrusel.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {

  // 🔹 AGREGADO
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
  // 🔹 FIN AGREGADO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Center(child: const Text('TURISGO')),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Registrarse()),
                );
              },
              child: Text("Registrarse", style: TextStyle(color: Colors.black)),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.directional(),
            child: TextButton(
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Login()),
                );
              },
              child: Text(
                "Iniciar Sesion",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        controller: _scrollController, // 🔹 AGREGADO
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

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

              const SizedBox(height: 25),
              const Text(
                "Categorías",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),

              CategoriasCarrusel(
                onCiudades: () => _scrollTo(_ciudadesKey),
                onPaquetes: () => _scrollTo(_paquetesKey),
                onHoteles: () => _scrollTo(_hotelesKey),
                onRestaurantes: () => _scrollTo(_restaurantesKey),
                onMoteles: () => _scrollTo(_motelesKey),
              ),

              const SizedBox(height: 30),
              const Text(
                "Recomendado para ti",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const CarruselInfinito(),

              const SizedBox(height: 30),
              const Text(
                "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(key: _ciudadesKey, child: CiudadesCarrusel()),

              const SizedBox(height: 30),
              const Text(
                "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(key: _paquetesKey, child: PaquetesCarrusel()),

              const SizedBox(height: 30),
              const Text(
                "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(key: _hotelesKey, child: HotelesCarrusel()),

              const SizedBox(height: 30),
              const Text(
                "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                key: _restaurantesKey,
                child: RestaurantesCarrusel(),
              ),

              const SizedBox(height: 30),
              const Text(
                "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(key: _motelesKey, child: MotelesCarrusel()),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
