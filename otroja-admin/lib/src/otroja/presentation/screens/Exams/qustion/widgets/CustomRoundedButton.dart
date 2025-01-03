import 'package:flutter/material.dart';
class CustomRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String imagePath;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const CustomRoundedButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.imagePath,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: 2),
              Image.asset(imagePath),
            ],
          ),
        ),
      ),
    );
  }
}