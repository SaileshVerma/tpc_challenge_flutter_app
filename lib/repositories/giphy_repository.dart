import 'dart:convert';

import 'package:giphy/services/api_services.dart';

class GiphyRepository {
  GiphyRepository() : _apiService = ApiServices();
  final ApiServices _apiService;

  Future<void> trendingGifs({
    required int limit,
    required int offset,
  }) async {
    const endPoint = '/v1/gifs/trending';

    final queryParams = {
      'limit': '$limit',
      'offset': '$offset',
    };

    final response = await _apiService.get(
      endPoint: endPoint,
      queryParams: queryParams,
    );

    final jsonData = json.decode(response.body);

    return jsonData;
  }
}
