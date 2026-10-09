import 'package:news_app_iti/core/api_client.dart';
import 'package:news_app_iti/features/home/data/models/news_model.dart';
import 'package:news_app_iti/features/home/data/repos/news_repo.dart';

class NewsRepoImpl extends NewsRepo {
  final ApiClient apiClient;
  NewsRepoImpl({required this.apiClient});
  @override
  Future<List<NewsModel>> getNews() async {
    try {
      final response = await apiClient.get(
        endpoint: '/top-headlines',
        queryParameters: {
          'country': 'us',
          'apiKey': '15068c5e92f14b1593206db31fed3ba6',
        },
      );
      List<NewsModel> newsList = [];
      for (var news in response['articles']) {
        newsList.add(NewsModel.fromJson(news));
      }

      return newsList;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
