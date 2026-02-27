import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';

class ProgressIndicatorRegistro extends StatelessWidget {
  final double progress; // 0.0 - 1.0

  const ProgressIndicatorRegistro({super.key, this.progress = 0.33});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: double.infinity,
      color: Colors.grey.shade300,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(color: AppColors.primary),
      ),
    );
  }
}
