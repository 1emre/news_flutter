import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:haber_sitesi/core/repository/new_repo_impl.dart';
import 'package:haber_sitesi/feature/news_headline/controller/news_headline_controller.dart';
import 'package:haber_sitesi/feature/search_news/controller/search_news_controller.dart';
import 'package:haber_sitesi/feature/tab_bar/controller/my_tab_contraller.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(MyTabController());
    Get.put(NewsHeadlineController());
    Get.put(SearchNewsController());
  }
}
