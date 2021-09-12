import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haber_sitesi/core/model/article.dart';
import 'package:haber_sitesi/core/repository/new_repo_impl.dart';
import 'package:haber_sitesi/core/repository/news_repo.dart';

class SearchNewsController extends GetxController {
  NewsRepo? _newsRepo;

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsLine();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  RxList<Article>? articles = RxList();

  searchNewsLine() async {
    showLoading();
    final result = await _newsRepo!.getSearchedNews(searchTextController.text);
    hideLoading();
    if (result != null) {
      articles = result.obs;
    } else {
      print("No data recieved");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
