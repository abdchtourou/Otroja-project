import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.hintText,
    this.onChange,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isRtl = true,
  });
  final String? hintText;
  Function(String)? onChange;
  bool obscureText;
  final Widget? prefixIcon; // Change type to Widget
  final Widget? suffixIcon; // Change type to Widget
  final bool isRtl;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFC2C0C0)),
        prefixIcon: isRtl ? suffixIcon : prefixIcon,
        suffixIcon: isRtl ? prefixIcon : suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE6E6E6)),
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
    );
  }
}