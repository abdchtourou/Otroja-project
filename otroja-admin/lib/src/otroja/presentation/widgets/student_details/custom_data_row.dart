
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDataRow extends StatelessWidget {
  final String label;
  final String value;

  CustomDataRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.only(bottom: 15 ,top : 15),
        color: OtrojaColors.primary2Color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Text(
                textAlign: TextAlign.center,
                value,
                style: TextStyle(
                  color: value.isEmpty ? Colors.red : Colors.black,
                ),
              ),
            ),
            const Expanded(flex: 1, child: Center(child: Text(':'))),
            Expanded(
              flex: 4,
              child: Text(
                textAlign: TextAlign.center,
                  label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
