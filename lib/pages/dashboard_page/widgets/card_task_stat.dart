import 'package:flutter/material.dart';

Widget cardTaskStat(String label, int count, Color color) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text("$count", style: const TextStyle(fontSize: 24)),
      ],
    ),
  );
}
