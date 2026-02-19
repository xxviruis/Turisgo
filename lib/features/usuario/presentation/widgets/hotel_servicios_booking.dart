import 'package:flutter/material.dart';

class HotelServiciosBooking extends StatelessWidget {
  final List<Map<String, dynamic>> servicios;

  const HotelServiciosBooking({super.key, required this.servicios});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1100,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: servicios.map((s) {
          return _item(
            icono: s["icono"],
            texto: s["texto"],
          );
        }).toList(),
      ),
    );
  }

  Widget _item({required IconData icono, required String texto}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 20),
          const SizedBox(width: 8),
          Text(texto, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
