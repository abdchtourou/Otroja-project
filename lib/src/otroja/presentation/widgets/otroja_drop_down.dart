import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaDropdown extends StatelessWidget {
  final List<String> list;
  String? labelText;
  String hint;
  Function(String?)? onChange;
  final ImageProvider? prefixIcon;
  final ImageProvider? suffixIcon;
  final bool isRtl;

  OtrojaDropdown({
    super.key,
    required this.list,
    required this.labelText,
    required this.hint,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.isRtl = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 15),
            child: Text(
              labelText!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        DropdownButtonFormField<String>(
          style: const TextStyle(color: Colors.white),
          validator: (value) {
            if (value!.isEmpty) {
              return 'field is required';
            }
          },
          onChanged: onChange,
          isExpanded: true,
          hint: Align(
            alignment: Alignment.centerRight,
            child: Text(
              hint,
              style: const TextStyle(
                  fontFamily: 'DIN Next LT Arabic', color: Color(0xFFC2C0C0)),
            ),
          ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Transform.scale(
                    scale: 0.6.sp,
                    child: ImageIcon(
                      isRtl ? suffixIcon : prefixIcon,
                      color: Color(0xFFE6E6E6),
                    ),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Transform.scale(
                    scale: 0.6.sp,
                    child: ImageIcon(
                      isRtl ? prefixIcon : suffixIcon,
                      color: Color(0xFFE6E6E6),
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE6E6E6)),
            ),
            contentPadding: isRtl
                ? const EdgeInsets.only(right: 16.0)
                : const EdgeInsets.only(left: 16.0),
          ),
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
