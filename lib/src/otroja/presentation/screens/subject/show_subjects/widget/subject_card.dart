import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: OtrojaColors.primary2Color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              width: 4, color: OtrojaColors.primaryColor)),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/pattern (7) 1.png"),
              const Spacer(),
              Image.asset("assets/images/pattern (7) 2.png"),
            ],
          ),
          const Text(
            "الفقه الشافعي",
            style: TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
                color: OtrojaColors.primaryColor,
                border: Border.all(
                    width: 4, color: OtrojaColors.primaryColor)),
            child: const Center(
              child: Text(
                "الفقه",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
