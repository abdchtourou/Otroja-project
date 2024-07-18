import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'standard_count_editor_widget.dart';

class StandardItem extends StatelessWidget {
  String title;
  StandardItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              StandardCountEditorWidget(icon: Icons.remove, onTap: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                      223,
                      239,
                      227,
                      211,
                    ),
                    border: Border.all(
                      color: Color(0xff85313C),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '56',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              StandardCountEditorWidget(
                icon: Icons.add,
                onTap: () {},
              ),
            ],
          ),
        ),
        Divider(
          color: Color.fromARGB(223, 234, 226, 215),
          thickness: 1.5,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
