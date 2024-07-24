import 'package:flutter/material.dart';
class AddSubjectCard extends StatelessWidget {
   AddSubjectCard({super.key,required this.onTap});
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffFFF9F5),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                width: 3, color: Colors.grey.shade200)),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/icons/pattern (8) 2.png"),
                const Spacer(),
                Image.asset("assets/icons/pattern (8) 1.png"),
              ],
            ),
            Image.asset('assets/icons/plus (12) 1.png',),

            const Text(
              'إضافة مادة',
              style: TextStyle(fontSize: 18,color:Colors.grey ),
            ),
          ],
        ),
      ),
    );
  }
}
