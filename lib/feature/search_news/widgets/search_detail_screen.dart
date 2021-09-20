import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDetailScreen extends StatelessWidget {
  const SearchDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<NewsHeadlineController>();
    var data = Get.arguments;
    return Scaffold(
      body: Column(
        children: [
          Image.network(data[0]['imageUrl']),
          // Text(_data[1]['tittle']),
          // Text(_data[2]['description']),
        ],
      ),
    );
  }
}
