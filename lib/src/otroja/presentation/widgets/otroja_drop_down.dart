import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class OtrojaDropdown extends StatelessWidget {
  final List<String> list;
  final String? labelText;
  final String hint;
  final ValueChanged<String?>? onChange;
  final bool isRtl;
  final String? value;

  const OtrojaDropdown({
    Key? key,
    required this.list,
    this.labelText,
    required this.hint,
    this.onChange,
    this.isRtl = true,
    this.value,
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
                  color: Color(0xff85313C), // Updated color
                ),
                textAlign: TextAlign.right,
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              isDense: true,
              value: value,
              hint: Align(
                alignment: Alignment.center,
                child: Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 17.75,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              dropdownColor: OtrojaColors.primary2Color,
              // Background color
              menuMaxHeight: 200,
              iconSize: 32,
              iconEnabledColor: const Color(0xFFE6E6E6),
              // Icon color
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
              onChanged: onChange,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.center,
                  value: value,
                  child: Text(
                    value,
                    textAlign: TextAlign.left,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
