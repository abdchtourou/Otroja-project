import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';

class SubjectCard extends StatelessWidget {
  String name;
  String category;
   SubjectCard({super.key, required this.name, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: OtrojaColors.primary2Color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 4, color: OtrojaColors.primaryColor)),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/pattern (7) 1.png"),
              const Spacer(),
              Image.asset("assets/images/pattern (7) 2.png"),
            ],
          ),
           Text(
           name,
            style: TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
                color: OtrojaColors.primaryColor,
                border: Border.all(width: 4, color: OtrojaColors.primaryColor)),
            child:  Center(
              child: Text(
                category,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
