import 'package:news_app_iti/features/home/data/models/news_model.dart';

dummyNewsList() {
  return List.generate(
    5,
    (index) => NewsModel(
      author: 'author $index',
      title: 'title $index',
      description: 'description $index',
      url: 'url $index',
      urlToImage: 'urlToImage $index',
      publishedAt: DateTime.now(),
      content: 'content $index',
    ),
  );
}
