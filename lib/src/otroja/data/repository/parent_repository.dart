// lib/repositories/parent_repository.dart


import '../datasource/api_services.dart';
import '../models/parent.dart';

class ParentRepository {
  final ApiService _apiService;


  ParentRepository(this._apiService);

  Future<Parent> addParent(Parent parent) async {
    try {
      final response = await _apiService.post(
        'register/parent',
        data: parent.toJson(),
      );
      return Parent.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to register parent: $e');
    }
  }
}