import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.rtl,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            'الحلقة المرادة',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.grey[300]!,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              alignment: Alignment.center,
              value: selectedValue,
              hint: const Text(
                'اختر حلقة',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.grey),
              ),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              isExpanded: true,
              items: <String>['حلقة 1', 'حلقة 2', 'حلقة 3'].map((String value) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: value,
                  child: Text(
                    value,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {

                  selectedValue = newValue!;

              },
            ),
          ),
        ),
      ],
    );
  }
}
