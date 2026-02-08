// lib/constants/app_inputs.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

InputDecoration inputStyle({required String label, required IconData icon}) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: kTealColor.withValues(alpha: 0.6)),
    prefixIcon: Icon(icon, color: kTealColor),
    filled: true,
    fillColor: kCreamColor.withValues(alpha: 0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: kTealColor, width: 1.5),
    ),
  );
}
