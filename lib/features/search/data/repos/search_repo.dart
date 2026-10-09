import 'package:news_app_iti/features/home/data/models/news_model.dart';

abstract class SearchRepo {
  Future<List<NewsModel>> getSearchedNews({required String text});
}
