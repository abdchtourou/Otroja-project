import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';

import '../../../../main.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/constant.dart';
import '../../data/datasource/api_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()){

    Permission();
  }
  ApiService apiService = ApiService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Permission()async{
    print('////////////////');
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

  }

  postData(BuildContext context) async {
    try {
      final data = AuthModel(
          userName: userNameController.text, password: passwordController.text);
      print(data);

      final response = await apiService.post("login", data: data.toJson());
    if(response.statusCode==200){
      Map<String, dynamic> responseBody = response.data;
      myToken = responseBody['data']['data']['token'];
      print('///////////////////////////');
        context.pushReplacementNamed(Routes.home);
    }
   else if(response.statusCode==501){
      print('//////////////////////////////////');

      //   showDialog(
      //   context: navigatorKey.currentState!.overlay!.context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: const Text("غير مسموح",textAlign: TextAlign.center
      //         ,),
      //       content: const Text("Invalid User Name or Password"),
      //       actions: [
      //         TextButton(
      //           child: const Text("عودة"),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //             // Optionally, navigate to the login page or another appropriate action
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );

    }
      print(response.statusCode);




    }catch(e){
      print(e);
    }
  

  }
}
class AuthModel {
  String? userName;
  String? password;

  AuthModel({this.userName, this.password});

  AuthModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}