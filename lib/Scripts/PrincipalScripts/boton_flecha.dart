import 'package:flutter/material.dart';

class BotonFlecha extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const BotonFlecha({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black45,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
