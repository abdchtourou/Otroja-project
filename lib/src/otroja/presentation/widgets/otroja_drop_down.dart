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
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: DropdownButtonFormField<String>(
              
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الحقل مطلوب';
                }
                return null;
              },
              value: value,
              hint: Text(
                "         $hint",
                style: TextStyle(color: Color(0xFFC2C0C0)),
                textAlign: TextAlign.end,
              ),
              onChanged: onChange,
              items: list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
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
            ),
          ),
        ),
      ],
    );
  }
}
