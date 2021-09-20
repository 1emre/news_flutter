import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haber_sitesi/core/widget/drawer.dart';
import 'package:haber_sitesi/feature/news_headline/view/news_headling_view.dart';
import 'package:haber_sitesi/feature/search_news/view/search_news_view.dart';
import 'package:haber_sitesi/feature/tab_bar/controller/my_tab_contraller.dart';

class MyTabbedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyTabController _tabx = Get.find<MyTabController>();
    // ↑ init tab controller

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("News")),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.login),
          )
        ],
        bottom: TabBar(
          controller: _tabx.controller,
          tabs: _tabx.myTabs,
          isScrollable: true,
        ),
      ),
      drawer: getAppDrawer(),
      body: TabBarView(
        controller: _tabx.controller,
        children: [
          NewsHeadLineView(),
          SearchNewsView(),
          SearchNewsView(),
          SearchNewsView(),
          SearchNewsView(),
          SearchNewsView(),
          SearchNewsView(),
          SearchNewsView(),
          SearchNewsView(),
        ],
      ),
    );
  }
}
