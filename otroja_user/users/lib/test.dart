// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:intl/intl.dart'; // For date formatting
// import 'package:otroja_users/src/core/utils/colors.dart';
// import 'package:otroja_users/src/otroja/presentation/widgets/otroja_app_bar.dart';
//
// import 'main.dart';
//
// class NotificationModel {
//   final String title;
//   final String body;
//   final DateTime timestamp;
//
//   NotificationModel(
//       {required this.title, required this.body, required this.timestamp});
//
//   // Convert NotificationModel to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'body': body,
//       'timestamp': timestamp.toIso8601String(),
//     };
//   }
//
//   // Convert JSON to NotificationModel
//   static NotificationModel fromJson(Map<String, dynamic> json) {
//     return NotificationModel(
//       title: json['title'],
//       body: json['body'],
//       timestamp: DateTime.parse(json['timestamp']),
//     );
//   }
// }
//
// class NotificationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//         backgroundColor: Colors.blue,
//       ),
//       body: notifications.isEmpty
//           ? Center(child: Text('No notifications yet.'))
//           : ListView.builder(
//               padding: EdgeInsets.all(16.0),
//               itemCount: notifications.length,
//               itemBuilder: (context, index) {
//                 final notification = notifications[index];
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 8),
//                   child: ListTile(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.blueAccent,
//                       child: Icon(Icons.notifications, color: Colors.white),
//                     ),
//                     title: Text(
//                       notification.title,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 5),
//                         Text(notification.body, style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 10),
//                         Text(
//                           DateFormat('MMM dd, yyyy – HH:mm')
//                               .format(notification.timestamp),
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     trailing: Icon(Icons.arrow_forward_ios,
//                         color: Colors.grey, size: 16),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
