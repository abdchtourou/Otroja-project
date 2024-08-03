// lib/repositories/parent_repository.dart

import '../datasource/api_services.dart';
import '../models/parent.dart';

class ParentRepository {
  final ApiService _apiService;

  ParentRepository(this._apiService);

  Future<List<Parent>> getAllParents() async {
    try {
      final response = await _apiService.get('parents');
      if (response.data['status'] == 200) {
        final List<dynamic> parentsData = response.data['data'];
        print(response);
        return parentsData.map((json) => Parent.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch parents: ${response.data['msg']}');
      }
    } catch (e) {
      throw Exception('Failed to fetch parents: $e');
    }
  }

  Future<Parent> addParent(Parent parent) async {
    try {
      print(parent.toJson());
      final response = await _apiService.post(
        'register/parent',
        data: parent.toJson(),
      );
      print(response);
      return Parent.fromJson(response.data['data']['parent']);
    } catch (e) {
      throw Exception('Failed to register parent: $e');
    }
  }
}
