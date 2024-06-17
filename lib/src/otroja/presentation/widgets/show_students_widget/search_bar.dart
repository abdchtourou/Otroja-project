import 'package:flutter/material.dart';

class SearchBarStudents extends StatelessWidget {
  const SearchBarStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Container(
        color: const Color.fromARGB(255, 238, 234, 228),
        child: TextField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              // Changed color to red
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              // Changed color to red when focused
            ),
            suffixIcon: Image.asset('assets/images/search (1) 1.png'),
            hintText: 'بحث',
            hintTextDirection: TextDirection.rtl,
            hintStyle: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
