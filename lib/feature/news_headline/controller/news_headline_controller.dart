import 'package:get/get.dart';
import 'package:haber_sitesi/core/model/article.dart';
import 'package:haber_sitesi/core/repository/new_repo_impl.dart';
import 'package:haber_sitesi/core/repository/news_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo? _newsRepo;

  int _currentPage = 1;
  int _pageSize = 10;
  late int totalPages = 200;

  //initialRefresh: false baslangıcta refresh olup olmucagını belırtıyoruz ben baslagıcta functionu calıstırdıgım ıcın true yapınca sureklı refresh edıyor
  // final RefreshController refreshController =
  //     RefreshController(initialRefresh: false);

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  RxList<Article>? articles = RxList();

  loadNewsLine(
      {bool isRefresh = false, RefreshController? refreshController}) async {
    showLoading();
    //isRefresh true olursa ilk page acılıyor
    if (isRefresh) {
      _currentPage = 1;
    } else {
      if (_currentPage >= totalPages) {
        //eger currentpage totalpage buyuk ve esıtse listenın sonuna gelmısız demektır ve artık data getirilemez.
        refreshController!.loadNoData();
        return false;
      }
    }
    final result = await _newsRepo!.getNewsHeadling(_currentPage, _pageSize);
    hideLoading();
    if (result != null) {
      if (isRefresh == true) {
        articles = result.articles!.toList().obs;
      } else {
        articles!.addAll(result.articles!.toList().obs);
      }
      _currentPage++;
      print(_currentPage);
      print(result.totalResults!);
      totalPages = result.totalResults!;

      // print(result);
      return true;
    } else {
      print("No data recieved");
      return false;
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  String timeAgo(DateTime fatchedDate) {
    DateTime currentDate = DateTime.now();

    var different = currentDate.difference(fatchedDate);

    if (different.inDays > 365)
      return "${(different.inDays / 365).floor()} ${(different.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (different.inDays > 30)
      return "${(different.inDays / 30).floor()} ${(different.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (different.inDays > 7)
      return "${(different.inDays / 7).floor()} ${(different.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (different.inDays > 0)
      return "${different.inDays} ${different.inDays == 1 ? "day" : "days"} ago";
    if (different.inHours > 0)
      return "${different.inHours} ${different.inHours == 1 ? "hour" : "hours"} ago";
    if (different.inMinutes > 0)
      return "${different.inMinutes} ${different.inMinutes == 1 ? "minute" : "minutes"} ago";
    if (different.inMinutes == 0) return 'Just Now';

    return fatchedDate.toString();
  }
}
