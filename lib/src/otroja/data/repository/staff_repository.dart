import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/staff_model.dart';
import 'package:dio/dio.dart';

class StaffRepository {
  final ApiService _apiService;

  StaffRepository(this._apiService);

  // Future<Staff> getStaffById(int id) async {
  //   try {
  //     final response = await _apiService.get('staff/$id');
  //     return Staff.fromJson(response.data);
  //   } on DioException catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<List<Staff>> getAllStaff() async {
  //   try {
  //     final response = await _apiService.get('staff');
  //     List<dynamic> staffJson = response.data;
  //     return staffJson.map((json) => Staff.fromJson(json)).toList();
  //   } on DioException catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<Staff> createStaff(Staff staff) async {
  //   try {
  //     final response = await _apiService.post('staff', data: staff.toJson());
  //     return Staff.fromJson(response.data);
  //   } on DioException catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<Staff> updateStaff(Staff staff) async {
  //   try {
  //     final response = await _apiService.put('staff/${staff.id}', data: staff.toJson());
  //     return Staff.fromJson(response.data);
  //   } on DioException catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<void> deleteStaff(int id) async {
  //   try {
  //     await _apiService.delete('staff/$id');
  //   } on DioException catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  Future<List<Staff>> getAllTeachers() async {
    try {
      final response = await _apiService.get('teachers');  // Keep the endpoint as 'teachers' if that's what your API uses
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