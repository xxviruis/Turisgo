import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/principal_screens/restaurante_detalle_page.dart';

class RestaurantesCarrusel extends StatelessWidget {
  RestaurantesCarrusel({super.key});

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> restaurantes = [
    {
      "img": "assets/images/restaurantes/arepas_con_todo_de_la_42.jpg",
      "nombre": "AREPAS CON TODO DE LA 42",
      "ubicacion": "IBAGUE",
      "puntuacion": 4.7,
      "tipo": "Comida rápida",
      "precio": "\$\$",
      "descripcion":
          "Famoso por sus arepas rellenas con ingredientes tradicionales y porciones generosas.",
    },
    {
      "img": "assets/images/restaurantes/el_rancherito.jpg",
      "nombre": "EL RANCHERITO",
      "ubicacion": "MEDELLIN",
      "puntuacion": 4.7,
      "tipo": "Parrilla",
      "precio": "\$\$\$",
      "descripcion":
          "Especialidad en carnes a la parrilla con recetas colombianas tradicionales.",
    },
    {
      "img": "assets/images/restaurantes/encanto_del_mar.jpg",
      "nombre": "ENCANTO DEL MAR",
      "ubicacion": "IBAGUE",
      "puntuacion": 4.7,
      "tipo": "Mariscos",
      "precio": "\$\$\$",
      "descripcion":
          "Restaurante de mariscos frescos con platos típicos de la costa.",
    },
    {
      "img": "assets/images/restaurantes/patakonos.jpg",
      "nombre": "PATAKONOS",
      "ubicacion": "IBAGUE",
      "puntuacion": 4.5,
      "tipo": "Comida caribeña",
      "precio": "\$\$",
      "descripcion":
          "Especialidad en patacones rellenos con sabores únicos.",
    },
    {
      "img": "assets/images/restaurantes/spoleto.jpg",
      "nombre": "SPOLETO",
      "ubicacion": "BOGOTA",
      "puntuacion": 4.2,
      "tipo": "Italiana",
      "precio": "\$\$",
      "descripcion":
          "Pastas personalizadas con ingredientes frescos al estilo italiano.",
    },
    {
      "img": "assets/images/restaurantes/sr_wok.jpg",
      "nombre": "SR WOK",
      "ubicacion": "IBAGUE",
      "puntuacion": 4.8,
      "tipo": "Comida asiática",
      "precio": "\$\$",
      "descripcion":
          "Cocina oriental con woks preparados al momento.",
    },
    {
      "img": "assets/images/restaurantes/tamales_de_la_pola.jpg",
      "nombre": "TAMALES DE LA POLA",
      "ubicacion": "IBAGUE",
      "puntuacion": 4.8,
      "tipo": "Comida típica",
      "precio": "\$",
      "descripcion":
          "Tradicionales tamales tolimenses con recetas artesanales.",
    },
  ];

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 240,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 240,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Encabezado con "Restaurantes" y "Ver más"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Restaurantes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Acción al pulsar "Ver más"
                  print("Ver más restaurantes");
                  // Aquí podrías navegar a otra pantalla de lista completa
                },
                child: const Text(
                  "Ver más",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Carrusel de restaurantes
        SizedBox(
          height: 260,
          child: Stack(
            children: [
              ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: restaurantes.length,
                itemBuilder: (_, index) {
                  final r = restaurantes[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RestauranteDetallePage(
                            restaurante: r,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                r["img"],
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                r["nombre"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "⭐ ${r["puntuacion"]} • ${r["ubicacion"]}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Botón izquierda
              Positioned(
                left: 0,
                top: 90,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: _scrollLeft,
                ),
              ),
              // Botón derecha
              Positioned(
                right: 0,
                top: 90,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: _scrollRight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
