import '../datasource/api_services.dart';
import '../models/recite_model.dart';

class ReciteRepository {
  final ApiService apiService;

  ReciteRepository(this.apiService);

  Future<int> createRecite(Recite recite) async {
    final response = await apiService.post(
      '/recite/create',
      data: recite.toJson(),
    );

    if (response.statusCode == 201) {
      print(response.data);
      return response.data['status'];
    } else {
      throw Exception('Failed to create recite');
    }
  }
}
