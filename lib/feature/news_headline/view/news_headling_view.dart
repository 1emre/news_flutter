import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haber_sitesi/core/widget/drawer.dart';
import 'package:haber_sitesi/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadLineView extends StatelessWidget {
  const NewsHeadLineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();

    return Scaffold(
        appBar: AppBar(
          title: const Text("News Headline"),
        ),
        drawer: getAppDrawer(),
        body: Obx(() {
          return controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ListView.separated(
                      itemBuilder: (_, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${controller.articles![i].publishedAt}'),
                            Image.network(
                                controller.articles![i].urlToImage.toString()),
                            const SizedBox(
                              height: 4,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${controller.articles![i].title}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text('${controller.articles![i].description}'),
                          ],
                        );
                      },
                      separatorBuilder: (_, i) {
                        return Divider();
                      },
                      itemCount: controller.articles!.length),
                );
        }));
  }
}
