import 'package:dio/dio.dart';

import '../../core/helper/constant.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl =
      'https://a797-149-34-244-165.ngrok-free.app/api/'; // Replace with your API base URL

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 100);
    _dio.options.receiveTimeout = const Duration(seconds: 100);
    // You can add more default configurations here
  }

  // GET request
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      print('////////////////////in get');

      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      print(e.message);
      throw _handleError(e);
    }
  }

  // POST request
  Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.post(path, data: data, queryParameters: queryParameters);

      return response;
    } on DioException catch (e) {
      print(e);
      throw _handleError(e);
    }
  }

  // PUT request
  Future<Response> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.put(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE request
  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: queryParameters);
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
