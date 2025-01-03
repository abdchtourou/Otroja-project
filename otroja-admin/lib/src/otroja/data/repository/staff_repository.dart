import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/staff_model.dart';
import 'package:dio/dio.dart';

class StaffRepository {
  final ApiService _apiService;

  StaffRepository(this._apiService);


  Future<List<Staff>> getAllStaff() async {
    try {
      final response = await _apiService.get('staffs'); // Adjust the endpoint as needed
      if (response.statusCode == 200) {
        List<dynamic> staffJson = response.data['data'];
        return staffJson.map((json) => Staff.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load staff');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  Future<List<Staff>> getAllTeachers() async {
    try {
      final response = await _apiService.get('teachers'); 
       // Keep the endpoint as 'teachers' if that's what your API uses
      if (response.statusCode == 200) {
        List<dynamic> teachersJson = response.data['data'];
        return teachersJson.map((json) => Staff.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load teachers');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

   Future<void> registerStaff(Staff staff) async {
    try {
      final response = await _apiService.post('register/staff', data: staff.toJson());
      if (response.data['status'] != 201) {
        throw Exception('Failed to register staff: ${response.data['msg']}');
      }
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

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