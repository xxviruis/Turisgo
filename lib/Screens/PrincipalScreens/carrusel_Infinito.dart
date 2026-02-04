import 'package:flutter/material.dart';
import 'package:flutter_application_1/Scripts/PrincipalScripts/boton_flecha.dart';

class CarruselInfinito extends StatefulWidget {
  const CarruselInfinito({super.key});

  @override
  State<CarruselInfinito> createState() => _CarruselInfinitoState();
}

class _CarruselInfinitoState extends State<CarruselInfinito> {
  final ScrollController _controller = ScrollController();
  final List<String> imagenes = [
    "https://picsum.photos/id/1018/600/350",
    "https://picsum.photos/id/1015/600/350",
    "https://picsum.photos/id/1016/600/350",
    "https://picsum.photos/id/1020/600/350",
    "https://picsum.photos/id/1035/600/350",
    "https://picsum.photos/id/1040/600/350",
  ];

  late List<String> listaExtendida;

  @override
  void initState() {
    super.initState();
    listaExtendida = List.generate(
      50,
      (_) => imagenes,
    ).expand((e) => e).toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(_controller.position.maxScrollExtent / 2);
    });
  }

  void moverDerecha() {
    _controller.animateTo(
      _controller.offset + 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void moverIzquierda() {
    _controller.animateTo(
      _controller.offset - 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: listaExtendida.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    listaExtendida[index],
                    width: 260,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            top: 80,
            child: BotonFlecha(
              icon: Icons.arrow_back,
              onPressed: moverIzquierda,
            ),
          ),
          Positioned(
            right: 0,
            top: 80,
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
