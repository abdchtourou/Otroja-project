import 'package:flutter/material.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';

class RemoveStudentDialog {
  static Future<bool> show(BuildContext context, ShowStudentModel student) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تأكيد الإزالة'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'هل أنت متأكد من رغبتك في إزالة الطالب ${student.firstName} ${student.lastName} من الحلقة؟',
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