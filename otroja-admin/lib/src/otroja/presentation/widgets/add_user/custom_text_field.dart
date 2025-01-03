import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.labelText,
      this.hintText,
      this.onChange,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.isRtl = true,
      this.type,
      required this.myController,
      this.validator});

  String? Function(String?)? validator;

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
              // padding: const EdgeInsets.only(bottom: 20.0, right: 15),
              padding: const EdgeInsets.only(bottom: 15.0, right: 15),

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
            validator: validator,
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
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: OtrojaColors.primaryColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE6E6E6)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical:15.0,
                horizontal: 16.0,
              ),
              fillColor: Colors.white,
              filled: true, // Ensure the background color is applied
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
