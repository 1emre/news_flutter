import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haber_sitesi/core/widget/drawer.dart';
import 'package:haber_sitesi/feature/search_news/controller/search_news_controller.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Search News"),
      ),
      drawer: getAppDrawer(),
      body: Column(
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(child: Obx(() {
            return controller.isLoading.isTrue
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.articles!.isEmpty
                    ? Center(
                        child: Text("Now News found"),
                      )
                    : Container(
                        child: ListView.separated(
                            itemBuilder: (_, i) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${controller.articles![i].publishedAt}'),
                                  Image.network(controller
                                      .articles![i].urlToImage
                                      .toString()),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '${controller.articles![i].title}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                      '${controller.articles![i].description}'),
                                ],
                              );
                            },
                            separatorBuilder: (_, i) {
                              return Divider();
                            },
                            itemCount: controller.articles!.length),
                      );
          }))
        ],
      ),
    );
  }
}
