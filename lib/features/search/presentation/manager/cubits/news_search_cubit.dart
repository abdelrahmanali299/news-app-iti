import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_iti/features/home/data/models/news_model.dart';
import 'package:news_app_iti/features/search/data/repos/search_repo.dart';

part 'news_search_state.dart';

class NewsSearchCubit extends Cubit<NewsSearchState> {
  @override
  void onChange(Change<NewsSearchState> change) {
    print(change);
    super.onChange(change);
  }

  NewsSearchCubit(this.searchRepo) : super(NewsSearchInitial());
  final SearchRepo searchRepo;

  searchNews({required String text}) {
    emit(NewsSearchLoading());
    searchRepo
        .getSearchedNews(text: text)
        .then((newsList) {
          emit(NewsSearchSuccess(newsList: newsList));
        })
        .catchError((error) {
          emit(NewsSearchError(message: error.toString()));
        });
  }
}
