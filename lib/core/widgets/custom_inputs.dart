import 'package:flutter/material.dart';

class GlassInput extends StatelessWidget {
  const GlassInput({
    super.key,
    required this.controller,
    required this.hint,
    this.obscure = false,
    this.enabled = true,
    this.type = TextInputType.text,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final bool enabled;
  final TextInputType type;

  static final _fillColor = Colors.white.withOpacity(0.08);
  static final _hintColor = Colors.white.withOpacity(0.6);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: type,
      enabled: enabled,
      style: TextStyle(color: enabled ? Colors.white : Colors.white38),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: _hintColor),
        filled: true,
        fillColor: _fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
