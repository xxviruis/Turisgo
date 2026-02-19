import 'package:flutter/material.dart';
import 'motel_detalle_screen.dart';

class MotelesCarrusel extends StatelessWidget {
  MotelesCarrusel({super.key});

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> moteles = [
    {
      "img": "assets/images/motel/piramides_de_cristal.jpg",
      "nombre": "PIRAMIDES DE CRISTAL",
      "ubicación": "CALI",
      "puntuacion": 4.2,
    },
    {
      "img": "assets/images/motel/ultimo_del_semana.jpg",
      "nombre": "ULTIMO DEL SEMANA",
      "ubicación": "MEDELLIN",
      "puntuacion": 4.6,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===== TÍTULO + VER MÁS =====
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Moteles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // futura pantalla de listado completo
                },
                child: const Text('Ver más'),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // ===== CARRUSEL =====
        SizedBox(
          height: 260,
          child: Stack(
            children: [
              ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: moteles.length,
                itemBuilder: (_, index) {
                  final motel = moteles[index];

                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                MotelDetalleScreen(motel: motel),
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
                            // IMAGEN
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                motel["img"],
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // NOMBRE
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                motel["nombre"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // PUNTUACIÓN + CIUDAD
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "⭐ ${motel["puntuacion"]} • ${motel["ubicación"]}",
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

              // ⬅️ FLECHA IZQUIERDA
              Positioned(
                left: 0,
                top: 95,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: _scrollLeft,
                ),
              ),

              // ➡️ FLECHA DERECHA
              Positioned(
                right: 0,
                top: 95,
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
