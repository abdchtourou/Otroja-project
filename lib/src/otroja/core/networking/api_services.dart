import 'package:dio/dio.dart';

import '../helper/constant.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.example.com'; // Replace with your API base URL

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    // You can add more default configurations here
  }

  // GET request
  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST request
  Future<Map<String, dynamic>> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      print("post $data");
      final response = await _dio.post(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      print(e);
      throw _handleError(e);
    }
  }

  // PUT request
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE request
  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
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