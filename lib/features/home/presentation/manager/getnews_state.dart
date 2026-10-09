part of 'getnews_cubit.dart';

@immutable
abstract class GetnewsState {}

class GetnewsInitial extends GetnewsState {}

class GetnewsLoading extends GetnewsState {}

class GetnewsSuccess extends GetnewsState {
  final List<NewsModel> newsList;
  GetnewsSuccess(this.newsList);
}

class GetnewsError extends GetnewsState {
  final String errorMessage;
  GetnewsError(this.errorMessage);
}
