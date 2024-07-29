import 'package:dio/dio.dart';
import '../datasource/api_services.dart';
import '../models/recite_model.dart';
import '../models/standard_model.dart';


class StandardRepository {
  final ApiService _apiService;

  StandardRepository(this._apiService);

  Future<List<Standard>> getStandards() async {
    try {
      Response response = await _apiService.get('/standards');
      List<dynamic> data = response.data;
      return data.map((json) => Standard.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load standards: $e');
    }
  }


  // Future<Standard> getStandardById(int id) async {
  //   try {
  //     Response response = await _apiService.get('/standards/$id');
  //     return Standard.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception('Failed to load standard: $e');
  //   }
  // }

  // Future<Standard> createStandard(Standard standard) async {
  //   try {
  //     Response response = await _apiService.post('/standards', data: standard.toJson());
  //     return Standard.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception('Failed to create standard: $e');
  //   }
  // }

  // Future<Standard> updateStandard(Standard standard) async {
  //   try {
  //     Response response = await _apiService.put('/standards/${standard.id}', data: standard.toJson());
  //     return Standard.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception('Failed to update standard: $e');
  //   }
  // }

  // Future<void> deleteStandard(int id) async {
  //   try {
  //     await _apiService.delete('/standards/$id');
  //   } catch (e) {
  //     throw Exception('Failed to delete standard: $e');
  //   }
  // }

  // Future<List<Standard>> searchStandards(String query) async {
  //   try {
  //     Response response = await _apiService.get('/standards', queryParameters: {'search': query});
  //     List<dynamic> data = response.data;
  //     return data.map((json) => Standard.fromJson(json)).toList();
  //   } catch (e) {
  //     throw Exception('Failed to search standards: $e');
  //   }
  // }

  // Future<List<Standard>> getStandardsByScoreDeduct(int scoreDeduct) async {
  //   try {
  //     Response response = await _apiService.get('/standards', queryParameters: {'score_deduct': scoreDeduct});
  //     List<dynamic> data = response.data;
  //     return data.map((json) => Standard.fromJson(json)).toList();
  //   } catch (e) {
  //     throw Exception('Failed to get standards by score deduct: $e');
  //   }
  // }
}