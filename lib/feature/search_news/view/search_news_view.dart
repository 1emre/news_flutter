import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haber_sitesi/feature/search_news/controller/search_news_controller.dart';
import 'package:haber_sitesi/feature/search_news/widgets/search_detail_screen.dart';

class SearchNewsView extends StatefulWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  State<SearchNewsView> createState() => _SearchNewsViewState();
}

class _SearchNewsViewState extends State<SearchNewsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();

    return Column(
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
                            return GestureDetector(
                              onTap: () {
                                Get.to(SearchDetailScreen(), arguments: [
                                  {
                                    "imageUrl":
                                        controller.articles![i].urlToImage
                                  },
                                  {"title": controller.articles![i].title},
                                  {
                                    "description":
                                        controller.articles![i].description
                                  },
                                ]);
                              },
                              child: Column(
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
                              ),
                            );
                          },
                          separatorBuilder: (_, i) {
                            return Divider();
                          },
                          itemCount: controller.articles!.length),
                    );
        }))
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
