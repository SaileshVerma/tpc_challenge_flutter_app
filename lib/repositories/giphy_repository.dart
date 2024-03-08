import 'dart:convert';

import 'package:giphy/models/api_response.dart';
import 'package:giphy/models/giphy.dart';
import 'package:giphy/services/api_services.dart';

class GiphyRepository {
  GiphyRepository() : _apiService = ApiServices();
  final ApiServices _apiService;

  Future<ApiResponse> trendingGifs({
    required int limit,
    required int offset,
  }) async {
    try {
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

      final data = jsonData['data'];

      final List<Giphy> gifs = [];

      for (final gif in data) {
        gifs.add(Giphy.fromJson(json: gif));
      }

      return ApiResponse(
        success: true,
        body: gifs,
      );
    } catch (error) {
      return ApiResponse(
        success: false,
        error: error,
      );
    }
  }
}
