import 'package:flutter/material.dart';
import 'package:news_app_iti/features/home/data/models/news_model.dart';
import 'package:news_app_iti/features/home/presentation/views/home_view_details.dart';
import 'package:news_app_iti/features/home/presentation/views/widgets/news_item.dart';

class NewsSliverList extends StatelessWidget {
  const NewsSliverList({super.key, required this.newsList});
  final List<NewsModel> newsList;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomeViewDetails(newsModel: newsList[index]),
              ),
            );
          },
          child: NewsItem(newsModel: newsList[index]),
        );
      },
    );
  }
}
