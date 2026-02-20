import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RegisterNegocioPro extends StatefulWidget {
  const RegisterNegocioPro({super.key});

  @override
  State<RegisterNegocioPro> createState() => _RegisterNegocioProState();
}

class _RegisterNegocioProState extends State<RegisterNegocioPro> {
  String? tipoNegocio;

  final List<String> tiposNegocio = [
    "Hotel",
    "Restaurante",
    "Tour",
    "Bar",
    "Tienda",
  ];

  final Map<String, List<String>> tiposPrecioPorNegocio = {
    "Hotel": ["Por noche", "Temporada alta", "Temporada baja"],
    "Restaurante": ["Plato promedio", "Menú ejecutivo"],
    "Tour": ["Adulto", "Niño", "Grupo"],
    "Bar": ["Entrada", "Reserva VIP"],
    "Tienda": ["Producto general"],
  };

  final List<Map<String, dynamic>> precios = [];

  final List<String> servicios = [
    "Wifi",
    "Piscina",
    "Parqueadero",
    "Aire acondicionado",
    "Guía incluido",
    "Desayuno",
  ];

  final Set<String> serviciosSeleccionados = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 30),
              _card(
                title: "Tipo de negocio",
                child: DropdownButtonFormField<String>(
                  value: tipoNegocio,
                  decoration: _inputDecoration(),
                  items: tiposNegocio
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      tipoNegocio = value;
                      precios.clear();
                    });
                  },
                ),
              ),
              const SizedBox(height: 25),
              _card(
                title: "Servicios",
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: servicios.map((servicio) {
                    final selected = serviciosSeleccionados.contains(servicio);
                    return FilterChip(
                      label: Text(servicio),
                      selected: selected,
                      onSelected: (_) {
                        setState(() {
                          selected
                              ? serviciosSeleccionados.remove(servicio)
                              : serviciosSeleccionados.add(servicio);
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 25),
              _card(
                title: "Precios",
                child: Column(
                  children: [
                    ...precios.map((precio) => _precioItem(precio)),
                    const SizedBox(height: 15),
                    if (tipoNegocio != null)
                      OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            precios.add({
                              "tipo":
                                  tiposPrecioPorNegocio[tipoNegocio!]!.first,
                              "valor": "",
                            });
                          });
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Agregar precio"),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _submitButton(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Registrar Negocio",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ).animate().fadeIn().slideX(begin: -0.2),
        const SizedBox(height: 6),
        const Text(
          "Configura tu negocio para hacerlo visible globalmente.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _card({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.1);
  }

  Widget _precioItem(Map<String, dynamic> precio) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              value: precio["tipo"],
              decoration: _inputDecoration(),
              items: tiposPrecioPorNegocio[tipoNegocio]!
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  precio["tipo"] = value;
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: _inputDecoration(hint: "Valor"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                precio["valor"] = value;
              },
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                precios.remove(precio);
              });
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF2F4F7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: const Text(
          "Publicar Negocio",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ).animate().fadeIn().scale(),
    );
  }
}
