import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextDate extends StatelessWidget {
  CustomTextDate({

    super.key,
    this.hintText,
    this.labelText,
    this.onChange,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isRtl = true,
  });
  final String? labelText;

  final String? hintText;
  Function(String)? onChange;
  bool obscureText;
  final Widget? prefixIcon; // Change type to Widget
  final Widget? suffixIcon; // Change type to Widget
  final bool isRtl;
  TextEditingController myController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          if (labelText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0,right: 15),
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
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(

                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if(pickedDate != null)
              {
                myController.text= DateFormat("yyyy-MM-dd").format(pickedDate);
                myController.text= DateTime.now() as String;
              }
            },
          ),
        ],
      ),
    );
  }
}