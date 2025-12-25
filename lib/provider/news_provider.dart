import 'package:flutter/material.dart';
import 'package:goalnow_app/model/news.dart';
import '../repository/news_repository.dart';

class NewsProvider extends ChangeNotifier {
  final NewsRepository _repository;

  NewsProvider(this._repository);

  /// State
  bool _loading = false;
  String? _error;
  List<NewsModel> _news = [];

  /// Getters
  bool get loading => _loading;
  String? get error => _error;
  List<NewsModel> get news => _news;

  /// Fetch data
  Future<void> fetchTrendingNews() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _news = await _repository.getTrendingNews();
    } catch (e) {
      _error = e.toString();
      debugPrint('Error fetching news: $_error');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  /// Clear data
  void clear() {
    _news = [];
    _error = null;
    notifyListeners();
  }
}
