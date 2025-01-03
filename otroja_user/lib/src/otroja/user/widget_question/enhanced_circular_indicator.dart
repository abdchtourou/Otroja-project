import 'package:flutter/material.dart';
class EnhancedCircularIndicator extends StatelessWidget {
  const EnhancedCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15, // Increased size for better visibility
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Colors.white, // Border color
          width: 2,
        ),
      ),
    )
    ;
  }
}
