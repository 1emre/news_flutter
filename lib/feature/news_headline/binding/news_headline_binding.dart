import 'package:get/get.dart';
import 'package:haber_sitesi/core/repository/new_repo_impl.dart';
import 'package:haber_sitesi/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }
}
