part of 'news_search_cubit.dart';

@immutable
abstract class NewsSearchState {}

class NewsSearchInitial extends NewsSearchState {}

class NewsSearchLoading extends NewsSearchState {}

class NewsSearchSuccess extends NewsSearchState {
  final List<NewsModel> newsList;
  NewsSearchSuccess({required this.newsList});
}

class NewsSearchError extends NewsSearchState {
  final String message;
  NewsSearchError({required this.message});
}
