import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditeDescripton extends StatelessWidget {
  EditeDescripton({super.key, required this.onTap});
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Image.asset(
          "assets/icons/edit.png",
          color: Color(0xFF85313C),
          scale: 25,
        ));
  }
}
