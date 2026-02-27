import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/registrar_negocio_controller.dart';
import 'card_container.dart';

class TipoNegocioSelector extends StatelessWidget {
  const TipoNegocioSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegistrarNegocioController>();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tipo de negocio",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            value: controller.tipoSeleccionadoId,
            items: controller.tipos
                .map(
                  (tipo) => DropdownMenuItem(
                    value: tipo.id,
                    child: Text(tipo.nombre),
                  ),
                )
                .toList(),
            onChanged: (value) {
              controller.tipoSeleccionadoId = value;
              controller.notifyListeners();
            },
            validator: (value) {
              if (value == null) {
                return "Selecciona un tipo de negocio";
              }
              return null;
            },
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
