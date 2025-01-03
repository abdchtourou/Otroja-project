import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0),
        border: Border.all(
          color: Color(0xFFA52A2A),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Color(0xFFEDEDED),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.alarm, color: Color(0xFFA52A2A)),
                SizedBox(width: 5),
                Text(
                  'الصلاة على وقتها',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'ينال الطالب خمس درجات لكل فريضة صلاة يؤديها على وقتها',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}