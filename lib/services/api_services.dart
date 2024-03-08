import 'package:giphy/utils/app_config.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<http.Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final apiQueryParams = {
      'api_key': AppConfig.apiKey,
      ...queryParams ?? {},
    };

    final uri = Uri.https(AppConfig.giphyUrl, endPoint, apiQueryParams);

    final response = await http.get(uri, headers: headers);

    return response;
  }
}
