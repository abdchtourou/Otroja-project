import 'package:flutter/material.dart';

class ImageTextCard extends StatelessWidget {
   ImageTextCard({super.key,required this.imagePath,required this.text,required this.onTap});
  String imagePath;
  String text;
   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
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
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image:AssetImage(imagePath) ),
            Text(text,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
          ],
        ),

      ),
    );
  }
}
