import 'package:flutter/material.dart';

class AddParent extends StatelessWidget {
   AddParent({super.key,required this.onTap});
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 94,
        height: 91,
        margin: const EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF85313C),
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: const Color(0xffbacEEEAE4),


        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image:AssetImage('assets/icons/add-group 1.png') ),
            Text("إضافة ولي أمر ",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
          ],
        ),

      ),
    );
  }
}
