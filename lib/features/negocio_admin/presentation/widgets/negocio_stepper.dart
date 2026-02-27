import 'package:flutter/material.dart';

class NegocioStepper extends StatelessWidget {
  final int currentStep;

  const NegocioStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = ["Información", "Multimedia", "Operaciones"];

    return Column(
      children: List.generate(
        steps.length,
        (index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: currentStep == index
                ? Colors.orange
                : Colors.grey.shade300,
            child: Text("${index + 1}"),
          ),
          title: Text(steps[index]),
        ),
      ),
    );
  }
}
