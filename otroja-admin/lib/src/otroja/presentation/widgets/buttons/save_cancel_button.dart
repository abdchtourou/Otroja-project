import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:flutter/material.dart';

import '../otroja_button.dart';
class SaveCancelButtons extends StatelessWidget {
  const SaveCancelButtons({super.key, required this.onPressedSave});
  final void Function() onPressedSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                      color: const Color(0xFF85313C), width: 2),
                ),
                child: const Center(
                  child: Text(
                    "إلغاء",
                    style: TextStyle(
                        color: Color(0xFF85313C), fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: OtrojaButton(
              text: "حفظ التغييرات",
              onPressed: onPressedSave
            ),
          ),
        ],
      ),
    ) ;
  }
}
