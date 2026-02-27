import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/features/negocio_admin/presentation/widgets/ciudad_selector.dart';
import 'package:provider/provider.dart';
import '../controller/registrar_negocio_controller.dart';
import 'card_container.dart';
import 'app_input_field.dart';

class InformacionGeneralCard extends StatelessWidget {
  const InformacionGeneralCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RegistrarNegocioController>();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Información General",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          AppInputField(
            label: "Nombre del negocio",
            validator: (value) => value == null || value.isEmpty
                ? "El nombre es obligatorio"
                : null,
            onChanged: (value) => controller.nombre = value,
          ),
          const SizedBox(height: 12),
          AppInputField(
            label: "Descripción",
            maxLines: 3,
            validator: (value) => value == null || value.isEmpty
                ? "La descripción es obligatoria"
                : null,
            onChanged: (value) => controller.descripcion = value,
          ),
          const SizedBox(height: 12),
          AppInputField(
            label: "Dirección",
            validator: (value) => value == null || value.isEmpty
                ? "La dirección es obligatoria"
                : null,
            onChanged: (value) => controller.direccion = value,
          ),
          AppSpacing.h12,
          CiudadSelector(),
        ],
      ),
    );
  }
}
