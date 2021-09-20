import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<NewsHeadlineController>();
    var data = Get.arguments;
    print(data);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                data[0]['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    data[1]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(data[2]['description']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Text(_data[1]['tittle'],
// Text(_data[2]['description']
