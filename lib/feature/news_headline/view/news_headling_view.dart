import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haber_sitesi/core/widget/drawer.dart';
import 'package:haber_sitesi/feature/news_headline/controller/news_headline_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsHeadLineView extends StatefulWidget {
  const NewsHeadLineView({Key? key}) : super(key: key);

  @override
  State<NewsHeadLineView> createState() => _NewsHeadLineViewState();
}

class _NewsHeadLineViewState extends State<NewsHeadLineView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("News Headline"),
      ),
      drawer: getAppDrawer(),
      body: Obx(
        () {
          // return controller.isLoading.isTrue
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          return Container(
            child: SmartRefresher(
              controller: refreshController,
              //default false oldugu ıcın asagı cekmeyı true yapmak gerekıyor
              enablePullDown: true,
              onRefresh: () async {
                //refresh oldugunda yapılması gereken hereketler
                final bool? result = await controller.loadNewsLine(
                    isRefresh: true, refreshController: refreshController);
                if (result == true) {
                  //await Future.delayed(Duration(milliseconds: 1000));
                  refreshController.refreshCompleted();
                } else {
                  refreshController.refreshFailed();
                }
              },
              enablePullUp: true,
              onLoading: () async {
                final bool? result = await controller.loadNewsLine();
                if (result == true) {
                  //await Future.delayed(Duration(milliseconds: 1000));
                  //setState(() {});
                  refreshController.loadComplete();
                } else {
                  refreshController.loadFailed();
                }
              },
              child: ListView.separated(
                  itemBuilder: (_, i) {
                    final controllerXd = controller.articles![i];
                    return Card(
                      elevation: 10,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          // color: Colors.yellow,
                          // border: Border.all(
                          //   color: Colors.red,
                          //   width: 2.0,
                          // ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                    controllerXd.urlToImage.toString())),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${controllerXd.title}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${controllerXd.description}'),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.timer),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                      '${controller.timeAgo(controllerXd.getPublishedAtDate!)} published'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, i) {
                    return Divider();
                  },
                  itemCount: controller.articles!.length),
            ),
          );
        },
      ),
    );
  }
}
