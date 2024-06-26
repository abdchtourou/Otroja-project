import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAppBar extends StatelessWidget {
  AddAppBar({super.key, required this.onTap});

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
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
  }
}
