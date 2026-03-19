import 'package:flutter/material.dart';

class HistorySentimentNeonDot extends StatelessWidget {
  final Color color;

  const HistorySentimentNeonDot({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.8),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}