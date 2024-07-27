// lib/repositories/parent_repository.dart

import '../datasource/api_services.dart';
import '../models/parent.dart';

class ParentRepository {
  final ApiService _apiService;

  ParentRepository(this._apiService);

  Future<int> addParent(Parent parent) async {
    try {
      print(parent.toJson());
      final response = await _apiService.post(
        'register/parent',
        data: parent.toJson(),
      );
      print(response);
      return response.data['status'];
    } catch (e) {
      throw Exception('Failed to register parent: $e');
    }
  }
}
