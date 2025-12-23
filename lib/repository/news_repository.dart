import 'package:goalnow_app/model/news.dart';
import '../service/news_service.dart';

class NewsRepository {
  final NewsService _service;

  NewsRepository(this._service);

  /// Lấy danh sách tin tức nổi bật
  Future<List<NewsModel>> getTrendingNews() async {
    return _service.getTrendingNews();
  }
}
