import 'package:news_app_iti/features/home/data/models/news_model.dart';

abstract class NewsRepo {
  Future<List<NewsModel>> getNews();
}
