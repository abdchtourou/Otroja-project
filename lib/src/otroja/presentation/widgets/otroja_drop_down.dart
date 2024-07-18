import 'package:flutter/material.dart';

class OtrojaDropdown extends StatelessWidget {
  final List<String> list;
  final String? labelText;
  final String hint;
  final Function(String?)? onChange;
  final ImageProvider? prefixIcon;
  final ImageProvider? suffixIcon;
  final bool isRtl;
  final String? value;

  const OtrojaDropdown({
    Key? key,
    required this.list,
    this.labelText,
    required this.hint,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.isRtl = true,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              labelText!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Directionality(
            textDirection:TextDirection.rtl,
            child: DropdownMenu<String>(
              width: MediaQuery.of(context).size.width - 15,
              initialSelection: value,
              onSelected: onChange,
              dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(
                  value: value,
                  label: value,
                );
              }).toList(),
              textStyle: const TextStyle(color: Colors.black),
              leadingIcon: prefixIcon != null
                  ? ImageIcon(
                isRtl ? suffixIcon! : prefixIcon!,
                color: const Color(0xFFE6E6E6),
              )
                  : null,
              trailingIcon: suffixIcon != null
                  ? ImageIcon(
                isRtl ? prefixIcon! : suffixIcon!,
                color: const Color(0xFFE6E6E6),
              )
                  : null,
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  
                  borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                ),
                contentPadding: isRtl
                    ? const EdgeInsets.only(right: 16.0)
                    : const EdgeInsets.only(left: 16.0),
              ),
              menuStyle: MenuStyle(
                alignment: isRtl ? Alignment.centerRight : Alignment.centerLeft,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
