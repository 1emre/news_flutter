import '../model/article.dart';

abstract class NewsRepo {
  Future<List<Article>?> getNewsHeadling();
  Future<List<Article>?> getSearchedNews(String query);
}
