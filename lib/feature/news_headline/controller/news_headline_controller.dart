import 'package:get/get.dart';
import 'package:haber_sitesi/core/model/article.dart';
import 'package:haber_sitesi/core/repository/new_repo_impl.dart';
import 'package:haber_sitesi/core/repository/news_repo.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo? _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  RxList<Article>? articles;

  loadNewsLine() async {
    showLoading();
    final result = await _newsRepo!.getNewsHeadling();
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
