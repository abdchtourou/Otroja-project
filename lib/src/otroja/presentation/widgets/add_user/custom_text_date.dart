import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextDate extends StatefulWidget {
  CustomTextDate({
    super.key,
    this.hintText,
    this.labelText,
    this.onChange,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isRtl = true,
    required this.myController
  });

  final String? labelText;
  final String? hintText;
  final Function(String)? onChange;
  final bool obscureText;
  final Widget? prefixIcon; // Change type to Widget
  final Widget? suffixIcon; // Change type to Widget
  final bool isRtl;
  TextEditingController myController ;


  @override
  _CustomTextDateState createState() => _CustomTextDateState();
}

class _CustomTextDateState extends State<CustomTextDate> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.labelText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 15),
              child: Text(
                widget.labelText!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          TextFormField(
            controller: widget.myController,
            obscureText: widget.obscureText,
            style: const TextStyle(color: Colors.black),
            validator: (value) {
              if (value!.isEmpty) {
                return 'field is required';
              }
              return null; // Add return statement to avoid lint error
            },
            onChanged: widget.onChange,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Color(0xFFC2C0C0)),
              prefixIcon: widget.isRtl ? widget.suffixIcon : widget.prefixIcon,
              suffixIcon: widget.isRtl ? widget.prefixIcon : widget.suffixIcon,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE6E6E6)),
              ),
              contentPadding: widget.isRtl
                  ? const EdgeInsets.only(right: 16.0)
                  : const EdgeInsets.only(left: 16.0),
            ),
            textAlign: widget.isRtl ? TextAlign.right : TextAlign.left,
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode()); // To prevent keyboard from appearing
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
                setState(() {
                 widget. myController.text = formattedDate;
                });
                if (widget.onChange != null) {
                  widget.onChange!(formattedDate);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
