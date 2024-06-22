import 'dart:ui';

import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> list;
  String? labelText;
  String? hint;

  CustomDropdown(
      {super.key,
      required this.list,
      required this.labelText,
      required this.hint});

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
          DropdownButtonFormField<String>(
            hint: Text(
              textDirection: TextDirection.rtl,
              hint!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            dropdownColor: const Color(0xff24292f),
            menuMaxHeight: 200,
            iconSize: 32,
            iconEnabledColor: const Color(0xFFE6E6E6),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFFE6E6E6),
                  width: 2.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color(0xFFE6E6E6),
                  width: 2.5,
                ),
              ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            elevation: 0,
            style: const TextStyle(
              fontFamily: "Dm Sans",
              fontSize: 17.75,
              color: Colors.black,
            ),
            onChanged: (value) {
              print(value);
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
