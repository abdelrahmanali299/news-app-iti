import 'package:dio/dio.dart';

class ApiClient {
  static const String baseUrl = 'https://newsapi.org/v2';

  static const String apiKey = '6a2bfa8471a048ddab606150547fe945';
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  get({
    required String endpoint,
    required Map<String, dynamic> queryParameters,
  }) async {
    final response = await _dio.get(endpoint, queryParameters: queryParameters);

    return response.data;
  }
}
