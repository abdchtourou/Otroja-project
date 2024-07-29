import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const LevelCard({
    Key? key,
    required this.name,
    required this.onPressed,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 252, 248, 248),
        border: Border(
          bottom: BorderSide(color: Color(0x229C9B9B)),
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$name ",
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
