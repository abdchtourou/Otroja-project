import 'package:admins/src/otroja/data/models/permission_model.dart';
import 'package:flutter/material.dart';

class RemovePermissionFromStaffDialog {
  static Future<bool> show(BuildContext context, Staff satff) async {
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
                  'هل أنت متأكد من رغبتك في إزالة الصلاحية من المشرف ${satff.firstName} ${satff.lastName} من الحلقة؟',
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