import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haber_sitesi/feature/tab_bar/controller/my_tab_contraller.dart';

getAppDrawer() {
  final MyTabController _tabx = Get.find<MyTabController>();
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: const Text("News Headline"),
          onTap: () {
            //Get.toNamed('/tabbar_news');
            _tabx.controller!.index = 0;
            Get.back();
          },
          leading: const Icon(Icons.contact_page_outlined),
        ),
        ListTile(
          title: const Text("Search News"),
          onTap: () {
            //Get.toNamed("/search_news");
            _tabx.controller!.index = 1;
            Get.back();
          },
          leading: const Icon(Icons.search),
        ),
      ],
    ),
  );
}
