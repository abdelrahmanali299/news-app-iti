import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_iti/features/home/presentation/manager/getnews_cubit.dart';
import 'package:news_app_iti/features/home/presentation/views/widgets/cat_item.dart';
import 'package:news_app_iti/features/search/presentation/manager/cubits/news_search_cubit.dart';

class CatListView extends StatefulWidget {
  const CatListView({super.key, required this.catList});
  final List<String> catList;

  @override
  State<CatListView> createState() => _CatListViewState();
}

class _CatListViewState extends State<CatListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 15),
      scrollDirection: Axis.horizontal,
      itemCount: widget.catList.length,
      itemBuilder: (context, index) {
        return Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              if (widget.catList[index] == 'All' && selectedIndex != index) {
                context.read<GetnewsCubit>().getNews();
              } else if (widget.catList[index] != 'All' &&
                  selectedIndex != index) {
                context.read<NewsSearchCubit>().searchNews(
                  text: widget.catList[index],
                );
              }
              setState(() {
                selectedIndex = index;
              });
            },
            child: CatItem(
              isSelected: index == selectedIndex ? true : false,
              title: widget.catList[index],
            ),
          ),
        );
      },
    );
  }
}
