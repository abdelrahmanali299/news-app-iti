import 'package:news_app_iti/core/api_client.dart';
import 'package:news_app_iti/features/home/data/models/news_model.dart';
import 'package:news_app_iti/features/search/data/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiClient apiClient;

  SearchRepoImpl({required this.apiClient});
  @override
  Future<List<NewsModel>> getSearchedNews({required String text}) async {
    try {
      var response = await apiClient.get(
        endpoint: '/everything',
        queryParameters: {
          'q': text,
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
