import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/registrar_negocio_controller.dart';
import 'card_container.dart';

class AmenidadesSelector extends StatefulWidget {
  const AmenidadesSelector({super.key});

  @override
  State<AmenidadesSelector> createState() => _AmenidadesSelectorState();
}

class _AmenidadesSelectorState extends State<AmenidadesSelector> {
  final TextEditingController customController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegistrarNegocioController>();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Amenidades",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          /// Checkboxes base
          ...controller.amenidadesBase.map(
            (amenidad) => CheckboxListTile(
              title: Text(amenidad),
              value: controller.amenidadesSeleccionadas.contains(amenidad),
              onChanged: (_) => controller.toggleAmenidad(amenidad),
            ),
          ),

          const SizedBox(height: 12),

          /// Campo personalizado
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: customController,
                  decoration: const InputDecoration(
                    hintText: "Agregar amenidad personalizada",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  controller.agregarAmenidadPersonalizada(
                    customController.text.trim(),
                  );
                  customController.clear();
                },
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Chips de seleccionadas
          Wrap(
            spacing: 8,
            children: controller.amenidadesSeleccionadas
                .map(
                  (amenidad) => Chip(
                    label: Text(amenidad),
                    deleteIcon: const Icon(Icons.close),
                    onDeleted: () => controller.eliminarAmenidad(amenidad),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
