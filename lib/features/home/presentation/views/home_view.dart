import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_iti/core/functions/dummy_news_list.dart';
import 'package:news_app_iti/features/home/presentation/manager/getnews_cubit.dart';
import 'package:news_app_iti/features/home/presentation/views/widgets/cat_list_view.dart';
import 'package:news_app_iti/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:news_app_iti/features/home/presentation/views/widgets/news_sliver_list.dart';
import 'package:news_app_iti/features/search/presentation/manager/cubits/news_search_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: HomeViewAppBar()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  'Breaking News',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  'Show More',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2C57F0),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 5)),
          SliverToBoxAdapter(
            child: Image.asset('assets/images/slider_img.png'),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: CatListView(
                catList: [
                  'All',
                  'Sports',
                  'Health',
                  'Entertainment',
                  'Science',
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  'News For You',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Show More',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2C57F0),
                  ),
                ),
              ],
            ),
          ),

          BlocBuilder<GetnewsCubit, GetnewsState>(
            builder: (context, state) {
              if (state is GetnewsLoading) {
                return Skeletonizer.sliver(
                  effect: ShimmerEffect(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Color(0xffFFA500),
                  ),
                  child: NewsSliverList(newsList: dummyNewsList()),
                );
              } else if (state is GetnewsSuccess) {
                return BlocBuilder<NewsSearchCubit, NewsSearchState>(
                  builder: (context, searchState) {
                    if (searchState is NewsSearchError) {
                      return SliverToBoxAdapter(
                        child: Center(child: Text(searchState.message)),
                      );
                    }
                    if (searchState is NewsSearchSuccess) {
                      return NewsSliverList(newsList: searchState.newsList);
                    } else if (searchState is NewsSearchLoading) {
                      return Skeletonizer.sliver(
                        effect: ShimmerEffect(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Color(0xffFFA500),
                        ),
                        child: NewsSliverList(newsList: dummyNewsList()),
                      );
                    }
                    return NewsSliverList(newsList: state.newsList);
                  },
                );
              } else if (state is GetnewsError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
              return SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
        ],
      ),
    );
  }
}
