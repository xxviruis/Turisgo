import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';

class HeaderRegistro extends StatelessWidget {
  const HeaderRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      color: Colors.white,
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Agregar Negocio",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Ayuda",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
