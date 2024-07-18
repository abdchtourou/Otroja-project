import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaTextFormField extends StatelessWidget {
  OtrojaTextFormField({
    super.key,
    this.hintText,
    this.onChange,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isRtl = true,
    required this.label,
  });

  final String label;
  final String? hintText;
  Function(String)? onChange;
  bool obscureText;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isRtl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, right: 15),
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
            prefixIcon: isRtl && suffixIcon != null
                ? Image.asset(
                    suffixIcon!,
                  )
                : !isRtl && prefixIcon != null
                    ? Image.asset(
                        prefixIcon!,
                        scale: 15,
                      )
                    : null,
            suffixIcon: isRtl && prefixIcon != null
                ? Image.asset(
                    prefixIcon!,
                    scale: 15,
                  )
                : !isRtl && suffixIcon != null
                    ? Image.asset(
                        suffixIcon!,
                        scale: 15,
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
          textAlign: isRtl ? TextAlign.right : TextAlign.left,
        ),
      ],
    );
  }
}
