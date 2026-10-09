import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_iti/core/api_client.dart';
import 'package:news_app_iti/features/home/data/repos/news_repo_impl.dart';
import 'package:news_app_iti/features/home/presentation/manager/getnews_cubit.dart';
import 'package:news_app_iti/features/home/presentation/views/home_view.dart';
import 'package:news_app_iti/features/layout/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:news_app_iti/features/search/data/repos/search_repo_impl.dart';
import 'package:news_app_iti/features/search/presentation/manager/cubits/news_search_cubit.dart';
import 'package:news_app_iti/features/search/presentation/views/search_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  List<Widget> pages = [
    HomeView(),
    SearchView(),
    const Center(child: Text("Saved")),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetnewsCubit(NewsRepoImpl(apiClient: ApiClient()))..getNews(),
        ),

        BlocProvider(
          create: (context) =>
              NewsSearchCubit(SearchRepoImpl(apiClient: ApiClient())),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: BottomNavBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          index: currentIndex,
        ),
        body: SafeArea(
          child: IndexedStack(index: currentIndex, children: pages),
        ),
      ),
    );
  }
}
