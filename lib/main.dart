import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_iti/features/layout/presentation/views/layout_view.dart';
import 'package:news_app_iti/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
