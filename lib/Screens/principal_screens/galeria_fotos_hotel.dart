import 'package:flutter/material.dart';

class GaleriaFotos extends StatefulWidget {
  final List<String> images;

  const GaleriaFotos({super.key, required this.images});

  @override
  State<GaleriaFotos> createState() => _GaleriaFotosState();
}

class _GaleriaFotosState extends State<GaleriaFotos> {
  bool modoGaleria = false;
  int imagenSeleccionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(modoGaleria ? "Galería" : "Fotos"),
        leading: modoGaleria
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    modoGaleria = false;
                  });
                },
              )
            : null,
        centerTitle: true,
      ),
      body: modoGaleria ? _vistaGaleria() : _vistaGrid(),
    );
  }

  // ================= GRID INICIAL (AJUSTADO) =================
  Widget _vistaGrid() {
  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: widget.images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 4 / 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                imagenSeleccionada = index;
                modoGaleria = true;
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    ),
  );
}


  // ================= GALERÍA TIPO BOOKING (SIN CAMBIOS) =================
  Widget _vistaGaleria() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double alturaDisponible = constraints.maxHeight;

        const double alturaMiniaturas = 90;
        const double espacios = 48;

        final double alturaImagen =
            alturaDisponible - alturaMiniaturas - espacios;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: Column(
              children: [
                const SizedBox(height: 16),

                // IMAGEN GRANDE
                SizedBox(
                  height: alturaImagen > 200 ? alturaImagen : 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.images[imagenSeleccionada],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // MINIATURAS
                SizedBox(
                  height: alturaMiniaturas,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.images.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final bool activa =
                          index == imagenSeleccionada;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            imagenSeleccionada = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration:
                              const Duration(milliseconds: 200),
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: activa
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
