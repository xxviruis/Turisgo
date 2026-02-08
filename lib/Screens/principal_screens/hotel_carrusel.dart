import 'package:flutter/material.dart';
import 'hotel_detalle_page.dart';

class HotelesCarrusel extends StatefulWidget {
  const HotelesCarrusel({super.key});

  @override
  State<HotelesCarrusel> createState() => _HotelesCarruselState();
}

class _HotelesCarruselState extends State<HotelesCarrusel> {
  final ScrollController _controller = ScrollController();

  final List<Map<String, dynamic>> hoteles = [
    {
      "img": "assets/images/hoteles/nh_cali_royale.jpg",
      "nombre": "NH Cali Royale",
      "ubicación": "CALI",
      "puntuacion": 4.5,
    },
    {
      "img": "assets/images/hoteles/aquamare.jpg",
      "nombre": "AQUAMARE",
      "ubicación": "SAN ANDRES",
      "puntuacion": 4.5,
    },
    {
      "img": "assets/images/hoteles/country_intrnational.jpg",
      "nombre": "COUNTRY INTERNATIONAL",
      "ubicación": "BARRANQUILLA",
      "puntuacion": 4.5,
    },
    {
      "img": "assets/images/hoteles/estelar_altamira.jpg",
      "nombre": "ESTELAR ALTAMIRA",
      "ubicación": "IBAGUE",
      "puntuacion": 4.5,
    },
    {
      "img": "assets/images/hoteles/irotama_lago.jpg",
      "nombre": "IROTAMA LAGO",
      "ubicación": "SANTA MARTA",
      "puntuacion": 4.5,
    },
    {
      "img": "assets/images/hoteles/las_americas_torre_del_mar.jpg",
      "nombre": "LAS AMERICAS TORRE DEL MAR",
      "ubicación": "CARTAGENA",
      "puntuacion": 4.5,
    },
    {
      "img": "assets/images/hoteles/san_fernando_plaza.jpg",
      "nombre": "SAN FERNANDO PLAZA",
      "ubicación": "MEDELLIN",
      "puntuacion": 4.5,
    },
    {
      "img": "assets/images/hoteles/sonesta_bogota.jpg",
      "nombre": "SONESTA BOGOTA",
      "ubicación": "BOGOTA",
      "puntuacion": 4.9,
    },
    {
      "img": "assets/images/hoteles/suma_wasi.jpg",
      "nombre": "SUMA WASI",
      "ubicación": "PUTUMAYO",
      "puntuacion": 4.0,
    },
    {
      "img": "assets/images/hoteles/sonesta_ibague.jpg",
      "nombre": "SONESTA IBAGUE",
      "ubicación": "IBAGUE",
      "puntuacion": 5.0,
    },
  ];

  void moverDerecha() {
    _controller.animateTo(
      _controller.offset + 260,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void moverIzquierda() {
    _controller.animateTo(
      _controller.offset - 260,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // HEADER: TÍTULO + VER MÁS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hoteles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // TODO: navegar a pantalla completa
                },
                child: const Text("Ver más"),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 260,
          child: Stack(
            children: [
              ListView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: hoteles.length,
                itemBuilder: (_, index) {
                  final hotel = hoteles[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                HotelDetallePage(hotel: hotel),
                          ),
                        );
                      },
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
                              borderRadius:
                                  const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                hotel["img"],
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                hotel["nombre"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8),
                              child: Text(
                                "⭐ ${hotel["puntuacion"]} \n ${hotel["ubicación"]}",
                                style:
                                    const TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // FLECHA IZQUIERDA
              Positioned(
                left: 0,
                top: 100,
                child:
                    _flecha(Icons.arrow_back_ios, moverIzquierda),
              ),

              // FLECHA DERECHA
              Positioned(
                right: 0,
                top: 100,
                child:
                    _flecha(Icons.arrow_forward_ios, moverDerecha),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _flecha(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
