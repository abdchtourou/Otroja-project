import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/colors.dart';
class SubjectDescription extends StatelessWidget {
  const SubjectDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: OtrojaColors.primaryColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 60.w,
            height: 25.h,
            decoration: const BoxDecoration(
                color: Color.fromARGB(223, 245, 236, 224),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(9))),
            child: const Text(
              'النبذة',
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'نتناول في هذا المنهج ما ورد عن الإمام محمد بن إدريس الشافعي في فقه الدين بجميع جوانبه',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
