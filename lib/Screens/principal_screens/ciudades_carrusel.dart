import 'package:flutter/material.dart';

class CiudadesCarrusel extends StatefulWidget {
  const CiudadesCarrusel({super.key});

  @override
  State<CiudadesCarrusel> createState() => _CiudadesCarruselState();
}

class _CiudadesCarruselState extends State<CiudadesCarrusel> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> ciudades = [
    {"img": "assets/images/ciudades/medellin.jpg", "nombre": "MEDELLIN"},
    {"img": "assets/images/ciudades/cartagena.jpg", "nombre": "CARTAGENA"},
    {"img": "assets/images/ciudades/bogota.jpg", "nombre": "BOGOTA"},
    {"img": "assets/images/ciudades/santa_marta.jpg", "nombre": "SANTA MARTA"},
    {"img": "assets/images/ciudades/ibague.jpg", "nombre": "IBAGUE"},
    {"img": "assets/images/ciudades/cali.jpg", "nombre": "CALI"},
    {"img": "assets/images/ciudades/barranquilla.jpg", "nombre": "BARRANQUILLA"},
    {"img": "assets/images/ciudades/san_andres.jpg", "nombre": "SAN ANDRES"},
  ];

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 240,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 240,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ciudades",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                },
                child: const Text("Ver más"),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: 230,
          child: Stack(
            children: [
              ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: ciudades.length,
                itemBuilder: (_, index) {
                  final ciudad = ciudades[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                              ciudad["img"]!,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              ciudad["nombre"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              Positioned(
                left: 8,
                top: 90,
                child: _ArrowButton(
                  icon: Icons.arrow_back_ios,
                  onTap: _scrollLeft,
                ),
              ),

              Positioned(
                right: 8,
                top: 90,
                child: _ArrowButton(
                  icon: Icons.arrow_forward_ios,
                  onTap: _scrollRight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 4),
          ],
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
