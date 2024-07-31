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
}