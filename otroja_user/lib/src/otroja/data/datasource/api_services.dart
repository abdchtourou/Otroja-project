import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../core/utils/constant.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 100);
    _dio.options.receiveTimeout = const Duration(seconds: 100);

    // Custom validateStatus to handle status codes like 401
    _dio.options.validateStatus = (status) {
      return status != null && status < 504; // Accept any status code < 500
    };

    // Add interceptors to attach the token to every request
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (myToken != null) {
          options.headers = {
            'Accept': 'application/json',
            'Authorization': 'Bearer $myToken',
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
  }

  // GET request
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    print(response);
    return _handleResponse(response);
  }

  // POST request
  Future<Response> post(String path,
      {required dynamic data, Map<String, dynamic>? queryParameters}) async {
    final response =
    await _dio.post(path, data: data, queryParameters: queryParameters);
    print('///////////////////');
    return _handleResponse(response);
  }

  // PUT request
  Future<Response> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    final response =
    await _dio.put(path, data: data, queryParameters: queryParameters);
    return _handleResponse(response);
  }

  // DELETE request
  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.delete(path, queryParameters: queryParameters);
    return _handleResponse(response);
  }

  // Handle the response and manage 401 Unauthorized
  Response _handleResponse(Response response) {
    if (response.statusCode == 401|| response.statusCode==403 ) {
      print('////////////////////////////.....................');
      _showUnauthorizedDialog();
    }
    return response;
  }

  void _showUnauthorizedDialog() {
    if (navigatorKey.currentState != null) {
      showDialog(
        context: navigatorKey.currentState!.overlay!.context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("غير مسموح",textAlign: TextAlign.center
              ,),
            content: const Text("انت غير مخول لاستخدام هذه الميزة"),
            actions: [
              TextButton(
                child: const Text("عودة"),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Optionally, navigate to the login page or another appropriate action
                },
              ),
            ],
          );
        },
      );
    }
  }


  // Error handling
  Exception _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(e.message ?? 'Connection timeout');
      case DioExceptionType.badResponse:
        return BadResponseException(e.response?.statusCode, e.response?.data);
      case DioExceptionType.cancel:
        return RequestCancelledException(e.message ?? 'Request cancelled');
      default:
        return UnknownException(e.message ?? 'An unknown error occurred');
    }
  }
}

// Custom exceptions
class TimeoutException implements Exception {
  final String message;

  TimeoutException(this.message);
}

class BadResponseException implements Exception {
  final int? statusCode;
  final dynamic data;

  BadResponseException(this.statusCode, this.data);
}

class RequestCancelledException implements Exception {
  final String message;

  RequestCancelledException(this.message);
}

class UnknownException implements Exception {
  final String message;

  UnknownException(this.message);
}
