import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';
import 'package:flutter_application_1/features/negocio_admin/domain/entities/ciudad.dart';
import 'package:flutter_application_1/features/negocio_admin/presentation/controller/registrar_negocio_controller.dart';
import 'package:provider/provider.dart';

class CiudadSelector extends StatelessWidget {
  const CiudadSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RegistrarNegocioController>();

    return Autocomplete<Ciudad>(
      displayStringForOption: (ciudad) =>
          "${ciudad.nombre}, ${ciudad.departamento}",
      optionsBuilder: (textEditingValue) async {
        if (textEditingValue.text.length < 2) {
          return const Iterable<Ciudad>.empty();
        }

        return await controller.buscarCiudades(textEditingValue.text);
      },
      onSelected: (ciudad) {
        controller.ciudadSeleccionadaId = ciudad.id;
      },
      fieldViewBuilder: (context, textController, focusNode, onSubmit) {
        return TextFormField(
          controller: textController,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: "Ciudad",
            filled: true,
            fillColor: AppColors.input,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (controller.ciudadSeleccionadaId == null) {
              return "Selecciona una ciudad válida";
            }
            return null;
          },
        );
      },
    );
  }
}
