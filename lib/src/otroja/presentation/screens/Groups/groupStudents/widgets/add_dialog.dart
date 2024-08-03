import 'package:flutter/material.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';

class AddDialog {
  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تأكيد الأضافة'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'يرجى تأكيد عملية الإضافة ',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('إلغاء'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('تأكيد'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ) ?? false;
  }
}