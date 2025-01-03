import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class OtrojaSearchBar1 extends StatelessWidget {
  final ValueNotifier<String> searchNotifier;

  const OtrojaSearchBar1({Key? key, required this.searchNotifier}) : super(key: key);

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
              borderSide: BorderSide(color: OtrojaColors.primaryColor),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: OtrojaColors.primaryColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: OtrojaColors.primaryColor),
            ),
            suffixIcon: Image.asset('assets/images/search (1) 1.png'),
            hintText: 'بحث',
            hintTextDirection: TextDirection.rtl,
            hintStyle: const TextStyle(color: Colors.black),
          ),
          onChanged: (value) {
            searchNotifier.value = value;
          },
        ),
      ),
    );
  }
}