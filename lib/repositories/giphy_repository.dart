import 'dart:convert';

import 'package:giphy/models/giphy.dart';
import 'package:giphy/providers/states/giphy_response_state.dart';
import 'package:giphy/services/api_services.dart';

class GiphyRepository {
  GiphyRepository() : _apiService = ApiServices();
  final ApiServices _apiService;

  Future<GiphyState> trendingGifs({
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
      print(data);
      final List<Giphy> gifs = [];

      for (final gif in data) {
        gifs.add(Giphy.fromJson(json: gif));
      }

      return GiphyState(
        gifs: gifs,
        error: null,
      );
    } catch (error) {
      return GiphyState(
        gifs: [],
        error: error,
      );
    }
  }
}
