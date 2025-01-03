// lib/data/repositories/permission_repository.dart

import '../datasource/api_services.dart';
import '../models/permission_model.dart';


class PermissionRepository {
  final ApiService _apiService;

  PermissionRepository(this._apiService);

  Future<List<Permission>> getPermissions() async {
    try {
      final response = await _apiService.get('/permissions');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Permission.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load permissions');
      }
    } catch (e) {
      throw Exception('Failed to load permissions: $e');
    }
  }

  Future<void> addPermissionToStaff(int permissionId, List<int> staffIds) async {
    try {
      final response = await _apiService.post('/permission/staffs',data:  {
        'permission_id': permissionId,
        'staff_ids': staffIds,
      });
      if (response.statusCode != 200) {
        throw Exception('Failed to add permission to staff');
      }
    } catch (e) {
      throw Exception('Failed to add permission to staff: $e');
    }
  }

  Future<void> removePermissionFromStaff(int permissionId, int staffId) async {
    try {
      final response = await _apiService.post('/permission/staffs/remove', data: {
        'permission_id': permissionId,
        'staff_id': staffId,
      });
      if (response.statusCode != 200) {
        throw Exception('Failed to remove permission from staff');
      }
    } catch (e) {
      throw Exception('Failed to remove permission from staff: $e');
    }
  }
}