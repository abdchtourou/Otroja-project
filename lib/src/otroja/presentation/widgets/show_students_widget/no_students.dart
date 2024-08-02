import 'package:flutter/material.dart';

class NoStudents extends StatelessWidget {
  const NoStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 226,
            width: 226,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/muslim 1.png"))),
          ),
          const Text(
            "عرض الطلاب",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text(
            "يبدو أنك لم تضف طالب حتى الأن ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 22.05 / 15,
              letterSpacing: 0.02,
            ),
          )
        ],
      ),
    );
  }
}
