import 'package:get/get.dart';
import 'package:haber_sitesi/feature/search_news/controller/search_news_controller.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
