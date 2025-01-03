import 'package:dio/dio.dart';

import '../datasource/api_services.dart';
import '../models/Document.dart';

class DocumentRepository {
  final ApiService _apiService;

  DocumentRepository(this._apiService);

  Future<List<Document>> fetchDocuments() async {
    final response = await _apiService.get('/references/all');
    final List data = response.data['data'];
    return data.map((json) => Document.fromJson(json)).toList();
  }
}