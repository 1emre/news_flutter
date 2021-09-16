import 'package:get/get.dart';
import 'package:haber_sitesi/core/model/article.dart';
import 'package:haber_sitesi/service/http_service.dart';
import 'package:haber_sitesi/service/http_service_impl.dart';

import '../model/news_response_model.dart';
import 'news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  HttpService? _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService!.init();
  }

  @override
  Future<NewsResponse?> getNewsHeadling(int page, int pageSize) async {
    // TODO: implement getNewsHeadling
    try {
      final response = await _httpService!.getRequest(
          "/v2/top-headlines?country=us&page=$page&pageSize=$pageSize");
      final parseResponse = NewsResponse.fromJson(response.data);
      return parseResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>?> getSearchedNews(String query) async {
    // TODO: implement getSearchedNews
    try {
      final response =
          await _httpService!.getRequest("/v2/everything?q=$query");
      final parseResponse = NewsResponse.fromJson(response.data);
      return parseResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
