import 'dart:convert';

import 'package:dio/dio.dart';

import '../helper/constant.dart';
class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1));
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> Get() async {
    Response response = await dio.get('');

    return response.data;
  }
}