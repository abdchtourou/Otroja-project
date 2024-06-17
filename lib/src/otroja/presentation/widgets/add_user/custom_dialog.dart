import 'package:flutter/material.dart';
import '../../../core/helper/constant.dart';

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AlertDialog(
          content: SizedBox(
            height: 230,
            child: Column(
              children: [
                Image.asset('assets/images/clock 1.png'),
                const Text(
                  'تمت إضافة الطالب بنجاح',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: dimensions.height / 3.1,
            right: 65,
            child:
            Container(
              height: 60,
              width: 281,
              decoration:  const BoxDecoration(
                  color: Color(0xFF85313C),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(30, 30),
                      bottomLeft: Radius.elliptical(30, 30))),
              child: Center(
                child: TextButton(onPressed: (){},child: const Text("عودة",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white
                  ),),),
              ),
            ),

        )
      ],
    );
  }
}
