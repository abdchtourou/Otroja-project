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
    this.controller,
    this.type,
    this.initialValue,
    required this.label,
  });
  final TextEditingController? controller;
  String? initialValue;
  final TextInputType? type;
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
        Directionality(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          child: TextFormField(
            initialValue:initialValue ,
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(color: Colors.black),
            validator: (value) {
              if (value!.isEmpty) {
                return 'الحقل مطلوب';
              }
            },
            keyboardType: type,
            onChanged: onChange,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xFFC2C0C0)),
              prefixIcon: prefixIcon != null
                  ? Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                        prefixIcon!,
                        scale: 15,
                      ),
                  )
                  : null,
              suffixIcon: suffixIcon != null
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
        ),
      ],
    );
  }
}
