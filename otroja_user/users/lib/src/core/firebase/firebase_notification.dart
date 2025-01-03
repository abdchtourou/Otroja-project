import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../utils/constant.dart';

class FirebaseNotification{
  final firebaseMessaging=FirebaseMessaging.instance;
  Future<void> initNotifications()async
  {
    await firebaseMessaging.requestPermission();
    String? fcmToken =await firebaseMessaging.getToken();
    print('///////////////////////////');
    print("$fcmToken");
    Dio dio =Dio();
    dio.options.baseUrl=baseUrl;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (myToken != null) {
          options.headers = {
            'Accept': 'application/json',
            'Authorization': 'Bearer $myToken',
            'fcm_token':fcmToken
          };
        }
        return handler.next(options); // Continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // Continue
      },
      onError: (DioException e, handler) {
        return handler.next(e); // Continue
      },
    ));
    await dio.post('setToken');


    print('///////////////////////////////////');
  }
}
