import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Gündem'),
    Tab(text: 'Magazin'),
    Tab(text: 'Spor'),
    Tab(text: 'Finans'),
    Tab(text: 'Kadın'),
    Tab(text: 'Yemek'),
    Tab(text: 'Trend'),
    Tab(text: 'Sinema'),
    Tab(text: 'Seyehat'),
  ];

  TabController? controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller!.dispose();
    super.onClose();
  }
}
