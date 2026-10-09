import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_iti/features/search/presentation/manager/cubits/news_search_cubit.dart';
import 'package:news_app_iti/features/search/presentation/views/widgets/searched_news_bloc_builder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      Future.delayed(Duration(seconds: 1), () {
        if (text == textEditingController.text) {
          if (text == '') {
            return;
          }
          context.read<NewsSearchCubit>().searchNews(text: text);
        }
      });
    });
  }

  String text = '';
  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  onChanged: (value) {
                    text = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 18),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0E0AB1)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0E0AB1)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Search',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  textEditingController.clear();
                  // text = 'All';
                },
                child: Text(
                  'Cancle',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff0E0AB1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(child: SearchedNewsBlocBuilder()),
        ],
      ),
    );
  }
}
