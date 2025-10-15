import 'package:flutter/material.dart';

class TextFieldCounter extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TextFieldCounter({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
