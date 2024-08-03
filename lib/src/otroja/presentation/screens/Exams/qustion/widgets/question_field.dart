import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionField extends StatelessWidget {
  QuestionField({
    super.key,
    this.hintText,
    this.onChange,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isRtl = true,
    required this.label, required this. controller,
  });

  final String label;
  final String? hintText;
  Function(String)? onChange;
  bool obscureText;
  final ImageProvider? prefixIcon;
  final ImageProvider? suffixIcon;
  final bool isRtl;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
           padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black),
          validator: (value) {
            if (value!.isEmpty) {
              return 'field is required';
            }
          },
          onChanged: onChange,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFC2C0C0)),
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
              borderSide: BorderSide(color: Color(0xFF85313C), width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF85313C), width: 2.w),

            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF85313C)),
            ),
            contentPadding: isRtl
                ? const EdgeInsets.only(right: 16.0)
                : const EdgeInsets.only(left: 16.0),
          ),
          textAlign: isRtl ? TextAlign.right : TextAlign.left,
        ),
      ],
    );
  }
}