import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final String date;
  final String levels;

  const CourseCard({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.date,
    required this.levels,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 19, 9, 9),
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
              Text(
                "$levels ",
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "$date ",
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
