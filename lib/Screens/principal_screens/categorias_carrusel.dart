import 'package:flutter/material.dart';
import 'package:flutter_application_1/Logic/PrincipalScripts/boton_flecha.dart';

class CategoriasCarrusel extends StatefulWidget {
  const CategoriasCarrusel({super.key});

  @override
  State<CategoriasCarrusel> createState() => _CategoriasCarruselState();
}

class _CategoriasCarruselState extends State<CategoriasCarrusel> {
  final ScrollController _controller = ScrollController();

  final List<Map<String, String>> categorias = [
    {
      "titulo": "Hoteles",
      "img":
          "https://blog.tipranks.com/wp-content/uploads/2021/07/HST-750x406.jpg",
    },
    {
      "titulo": "Paquetes",
      "img":
          "https://tmjuntos.com.br/wp-content/uploads/2019/09/Intercambio.jpg",
    },
    {"titulo": "Moteles", "img": "https://i.redd.it/v8j0obazgyt11.jpg"},
    {
      "titulo": "Ciudades",
      "img":
          "https://www.fodors.com/wp-content/uploads/2019/03/Hero_BogotaPartyCapitol_Heroshutterstock_1019031940.jpg",
    },
    {
      "titulo": "Restaurante",
      "img":
          "https://wallpapers.com/images/hd/imagenesde-restaurantes-f5mhuvhh18esh0jd.jpg",
    },
  ];

  late List<Map<String, String>> extendida;

  @override
  void initState() {
    super.initState();
    extendida = List.generate(40, (_) => categorias).expand((e) => e).toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(_controller.position.maxScrollExtent / 2);
    });
  }

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
    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: extendida.length,
            itemBuilder: (_, index) {
              final c = extendida[index];
              return Padding(
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
                        child: Image.network(
                          c["img"]!,
                          width: 220,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        c["titulo"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            top: 100,
            child: BotonFlecha(
              icon: Icons.arrow_back,
              onPressed: moverIzquierda,
            ),
          ),
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
}
