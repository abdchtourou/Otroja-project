import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? optionalWidget; 
  String? mainText;
  String? secText;

  OtrojaAppBar({super.key, this.optionalWidget, required this.mainText, this.secText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF85313C),
                width: 5,
              ),
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                25,
                25,
              ),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/appBarBackground.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(100, 245, 243, 239),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                25,
                25,
              ),
            ),
          ),
        ),
Row(
  children: [
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Color(0xFF85313C),
        size: 30,
      ),
    ),
    Expanded( // Keep the Expanded widget to allow the Column to expand
      child: Center( // Wrap the Column with a Center widget
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              mainText!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              secText?? " ",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 1.47,
                  letterSpacing: 0.02,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 119, 119, 119)),
            ),
          ],
        ),
      ),
    ),
   ...optionalWidget!= null? [Padding(
      padding: const EdgeInsets.all(6.0),
      child: optionalWidget!,
    )] : [SizedBox(
    width: 40.w,
   )],
  ],
),



        
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
