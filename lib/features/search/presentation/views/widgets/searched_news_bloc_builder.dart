import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_iti/core/functions/dummy_news_list.dart';
import 'package:news_app_iti/features/search/presentation/manager/cubits/news_search_cubit.dart';
import 'package:news_app_iti/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchedNewsBlocBuilder extends StatelessWidget {
  const SearchedNewsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsSearchCubit, NewsSearchState>(
      builder: (context, state) {
        if (state is NewsSearchLoading) {
          return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey.shade300,
              highlightColor: Color(0xffFFA500),
            ),
            child: SearchListView(newsList: dummyNewsList()),
          );
        } else if (state is NewsSearchSuccess) {
          return SearchListView(newsList: state.newsList);
        } else if (state is NewsSearchError) {
          return Center(child: Text(state.message));
        }
        return Lottie.asset('assets/lotties/No-Data.json');
      },
    );
  }
}
