import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/Screens/PrincipalScreens/carrusel_Infinito.dart';
import 'package:flutter_application_1/Screens/PrincipalScreens/categorias_carrusel.dart';
import 'package:flutter_application_1/Screens/PrincipalScreens/hotel_carrusel.dart';
import 'package:flutter_application_1/Screens/PrincipalScreens/restaurante_carrusel.dart';
import 'package:flutter_application_1/Screens/registrarse.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
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
                  MaterialPageRoute(
                    builder: (context) {
                      return Registrarse();
                    },
                  ),
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
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
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
              const CategoriasCarrusel(),
              const SizedBox(height: 30),
              const Text(
                "Recomendado para ti",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const CarruselInfinito(),
              const SizedBox(height: 30),
              const Text(
                "Hoteles populares",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              HotelesCarrusel(),
              const SizedBox(height: 30),
              const Text(
                "Restaurantes recomendados",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              RestaurantesCarrusel(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
