import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.onChange,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isRtl = true,
    this.type,
    required this.myController,
  });

  final String? labelText;
  final String? hintText;
  final Function(String)? onChange;
  final bool obscureText;
  final Widget? prefixIcon; // Change type to Widget
  final Widget? suffixIcon; // Change type to Widget
  final bool isRtl;
  final TextInputType? type;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (labelText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 15),
              child: Text(
                labelText!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          TextFormField(
            controller: myController,
            obscureText: obscureText,
            style: const TextStyle(color: Colors.black),
            validator: (value) {
              if (value!.isEmpty) {
                return 'field is required';
              }
              return null;
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
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 16.0), // Adjust padding to increase height
            ),
            textAlign: isRtl ? TextAlign.right : TextAlign.left,
            keyboardType: type,
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
