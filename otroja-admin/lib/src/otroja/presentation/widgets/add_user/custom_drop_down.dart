import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
class CustomDropdown extends StatelessWidget {
  final List<String> list;
  final String? labelText;
  final String? hint;
  final ValueChanged<String?> onChanged;

  CustomDropdown({
    Key? key,
    required this.list,
    required this.labelText,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

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
            isExpanded: true,
            isDense: true,
            hint: Align(
              alignment: Alignment.centerRight,
              child: Text(
                hint!,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            dropdownColor: OtrojaColors.primary2Color,
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
              fontSize: 17.75,
              color: Colors.black,
            ),
            onChanged: onChanged, // Call the callback function here
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                alignment:AlignmentDirectional.center ,
                value: value,
                child: Text(value,textAlign: TextAlign.left,),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
