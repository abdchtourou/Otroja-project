import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageStudent extends StatelessWidget {
  ImageStudent({super.key, this.isEdit=false});



  bool? isEdit ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      margin: const EdgeInsets.only(left: 24, top: 1),
      // color: Colors.red,

      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 94,
              height: 91,
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffbacEEEAE4),
                  image: DecorationImage(
                      image: AssetImage('assets/images/people (1) 1.png'))),
            ),
          ),
          Positioned(
            bottom: 19,
            right: 10,
            child: Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                  color: Color(0xFF85313C),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                iconSize: 35,
                onPressed: () {},

                constraints: const BoxConstraints.tightFor(
                  width: 35,
                  height: 35,
                ),
                visualDensity: VisualDensity.compact,
                splashRadius: 18,
                // Adjust as needed
                color: Colors.black, // Add icon color
              ),
            ),
          ),
          if (isEdit!)
            Positioned(
              bottom: 110,
              right: 10,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border:
                        Border.all(color: const Color(0xFF85313C), width: 2)),
                child: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Color(0xFF85313C),
                    size: 20,
                  ),
                  iconSize: 35,
                  onPressed: () {},

                  constraints: const BoxConstraints.tightFor(
                    width: 35,
                    height: 35,
                  ),
                  visualDensity: VisualDensity.compact,
                  splashRadius: 18,
                  // Adjust as needed
                  color: Colors.black, // Add icon color
                ),
              ),
            ),
        ],
      ),
    );
  }
}
