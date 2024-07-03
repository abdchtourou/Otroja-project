import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAppBar extends StatelessWidget {
  AddAppBar({super.key, required this.onTap});

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
     return 
    IconButton(
        onPressed: onTap,
        icon: Image.asset(
          "assets/icons/add.png",
          color: Color(0xFF85313C),
          width: 30, // Specify width instead of size
          height: 30, // Specify height instead of size
        ));
=======
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/add 1.png'))),
      ),
    );
>>>>>>> origin/rest-api-page-show-student
  }
}
