import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/usuario/domain/usecases/principal_logic/boton_flecha.dart';

class CategoriasCarrusel extends StatefulWidget {
  final VoidCallback? onHoteles;
  final VoidCallback? onPaquetes;
  final VoidCallback? onMoteles;
  final VoidCallback? onCiudades;
  final VoidCallback? onRestaurantes;

  const CategoriasCarrusel({
    super.key,
    this.onHoteles,
    this.onPaquetes,
    this.onMoteles,
    this.onCiudades,
    this.onRestaurantes,
  });

  @override
  State<CategoriasCarrusel> createState() => _CategoriasCarruselState();
}

class _CategoriasCarruselState extends State<CategoriasCarrusel> {
  late final ScrollController _controller;
  late final List<_CategoriaItem> categorias;

  // Para simular infinito
  static const int loopMultiplier = 1000; // Cantidad grande para scroll infinito virtual

  @override
  void initState() {
    super.initState();

    categorias = [
      _CategoriaItem(
        titulo: 'Hoteles',
        img: 'assets/images/hotel.jpg',
        onTap: widget.onHoteles,
      ),
      _CategoriaItem(
        titulo: 'Paquetes',
        img: 'assets/images/paquetes.jpg',
        onTap: widget.onPaquetes,
      ),
      _CategoriaItem(
        titulo: 'Moteles',
        img: 'assets/images/motel.jpg',
        onTap: widget.onMoteles,
      ),
      _CategoriaItem(
        titulo: 'Ciudades',
        img: 'assets/images/ciudades.jpg',
        onTap: widget.onCiudades,
      ),
      _CategoriaItem(
        titulo: 'Restaurantes',
        img: 'assets/images/restaurante.jpg',
        onTap: widget.onRestaurantes,
      ),
    ];

    // Inicializamos el ScrollController en el medio de la "lista infinita"
    _controller = ScrollController(
      initialScrollOffset: categorias.length * loopMultiplier / 2 * 236, // 220 + 16 padding
    );
  }

  void moverDerecha() {
    _controller.animateTo(
      _controller.offset + 236, // ancho + padding
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void moverIzquierda() {
    _controller.animateTo(
      _controller.offset - 236,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: categorias.length * loopMultiplier, // lista "infinita"
            itemBuilder: (_, index) {
              final c = categorias[index % categorias.length]; // repetimos elementos

              return GestureDetector(
                onTap: c.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.asset(
                            c.img,
                            width: 220,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          c.titulo,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
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
            top: 100,
            child: BotonFlecha(
              icon: Icons.arrow_back,
              onPressed: moverIzquierda,
            ),
          ),

          // Botón derecha
          Positioned(
            right: 0,
            top: 100,
            child: BotonFlecha(
              icon: Icons.arrow_forward,
              onPressed: moverDerecha,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _CategoriaItem {
  final String titulo;
  final String img;
  final VoidCallback? onTap;

  _CategoriaItem({
    required this.titulo,
    required this.img,
    this.onTap,
  });
}
