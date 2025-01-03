import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';

class FilterBar extends StatelessWidget {
   FilterBar({super.key,required this.text});
  String? text;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0,left: 8),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
          ),
          color:   Color(0xbbEEEAE4),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14),
          child: Row(
            children: [
              const Spacer(),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                        color: OtrojaColors.primaryColor
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
