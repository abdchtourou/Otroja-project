import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final double borderRadius;

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.size = 35,
    this.backgroundColor = const Color(0xFF85313C),
    this.iconColor = Colors.white,
    this.borderRadius = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFF85313C),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
          size: size * 0.57, // Adjusting icon size relative to container size
        ),
        iconSize: size,
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width: size,
          height: size,
        ),
        visualDensity: VisualDensity.compact,
        splashRadius: size * 0.5, // Adjust splash radius relative to container size
      ),
    );
  }
}
