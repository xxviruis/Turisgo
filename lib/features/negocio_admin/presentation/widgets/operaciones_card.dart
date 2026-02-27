import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/registrar_negocio_controller.dart';
import 'card_container.dart';
import 'app_input_field.dart';

class OperacionesCard extends StatelessWidget {
  const OperacionesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RegistrarNegocioController>();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Operaciones",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          AppInputField(
            label: "Teléfono",
            keyboardType: TextInputType.phone,
            validator: (value) => value == null || value.isEmpty
                ? "El teléfono es obligatorio"
                : null,
            onChanged: (value) => controller.telefono = value,
          ),
          const SizedBox(height: 12),
          AppInputField(
            label: "Email del negocio",
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "El email es obligatorio";
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return "Formato de email inválido";
              }
              return null;
            },
            onChanged: (value) => controller.email = value,
          ),
        ],
      ),
    );
  }
}
