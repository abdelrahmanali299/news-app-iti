import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_iti/features/home/data/models/news_model.dart';
import 'package:news_app_iti/features/home/data/repos/news_repo.dart';

part 'getnews_state.dart';

class GetnewsCubit extends Cubit<GetnewsState> {
  @override
  void onChange(Change<GetnewsState> change) {
    log(change.toString());
    super.onChange(change);
  }

  GetnewsCubit(this.newsRepo) : super(GetnewsInitial());

  final NewsRepo newsRepo;

  getNews() async {
    emit(GetnewsLoading());
    try {
      final news = await newsRepo.getNews();
      emit(GetnewsSuccess(news));
    } catch (e) {
      emit(GetnewsError(e.toString()));
    }
  }
}
