import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/registrar_negocio_controller.dart';
import '../../../../core/theme/colors.dart';

class BottomActions extends StatelessWidget {
  const BottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegistrarNegocioController>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: controller.isLoading
                  ? null
                  : () async {
                      await controller.guardar();
                    },
              child: controller.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Guardar y Continuar"),
            ),
          ),
        ],
      ),
    );
  }
}
