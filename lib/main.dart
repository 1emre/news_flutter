import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haber_sitesi/feature/news_headline/binding/news_headline_binding.dart';
import 'package:haber_sitesi/feature/search_news/binding/search_news_binding.dart';

import 'feature/news_headline/view/news_headling_view.dart';
import 'feature/search_news/view/search_news_view.dart';
import 'feature/tab_bar/binding/tab_bar_binding.dart';
import 'feature/tab_bar/view/tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: "/news_headline",
          page: () => NewsHeadLineView(),
          binding: NewsHeadlingBinding(),
        ),
        GetPage(
          name: '/search_news',
          page: () => SearchNewsView(),
          binding: SearchNewsBinding(),
        ),
        GetPage(
          name: '/tabbar_news',
          page: () => MyTabbedWidget(),
          binding: TabBarBinding(),
        ),
      ],
      initialRoute: "/tabbar_news",
    );
  }
}
