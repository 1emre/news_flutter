import '../model/article.dart';
import '../model/news_response_model.dart';

abstract class NewsRepo {
  Future<NewsResponse?> getNewsHeadling(int page, int pageSize);
  Future<List<Article>?> getSearchedNews(String query);
}
