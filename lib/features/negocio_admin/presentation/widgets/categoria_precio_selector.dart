import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';

class CategoriaPrecioSelector extends StatelessWidget {
  final int selected;
  final Function(int) onChanged;

  const CategoriaPrecioSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = ["\$", "\$\$", "\$\$\$"];

    return Row(
      children: List.generate(options.length, (index) {
        final isActive = selected == index;

        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.input,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
