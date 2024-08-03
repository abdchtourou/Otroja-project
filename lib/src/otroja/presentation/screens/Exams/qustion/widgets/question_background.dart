import 'package:flutter/material.dart';

class QuestionBackground extends StatelessWidget {
  const QuestionBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: Color(0xFF85313C),
              child: Stack(
                children: [
                  Positioned(
                    left: -MediaQuery.of(context).size.width * 0.25,
                    child: Image.asset(
                      'assets/icons/zokhrof.png',
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.cover,
                      color: Color(0xFFFFF5EC),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        );
  }
}