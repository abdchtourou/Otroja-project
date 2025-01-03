import '../datasource/api_services.dart';
import '../models/myRecite.dart';

class MyReciteRepository {
  final ApiService _apiService;
  MyReciteRepository(this._apiService);

Future<List<MyRecite>> fetchRecites() async {
  try {
    final response = await _apiService.get('recites/student');
    print(response);

    
    if (response.data is Map<String, dynamic> && response.data['data'] is List) {
      
      List<dynamic> nestedRecites = response.data['data'].first; 

      List<MyRecite> recites = nestedRecites
          .map((reciteList) => MyRecite.fromJson(reciteList))
          .toList();

      print('Number of recites fetched: ${recites.length}');
      return recites;
    } else {
      throw Exception('Unexpected response format: ${response.data}');
    }
  } catch (e) {
    print('Error details: $e');
    throw Exception('Failed to load recites: $e');
  }
}
}
