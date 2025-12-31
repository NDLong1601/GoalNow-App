import 'package:goalnow_app/model/new/news.dart';
import 'package:flutter/material.dart';
import 'package:goalnow_app/service/api/news_service.dart';

class NewsRepository {
  final NewsService _service;

  NewsRepository(this._service);

  /// TRENDING NEWS
  Future<List<NewsModel>> getTrendingNews() async {
    debugPrint('Fetching trending news');
    return _service.getTrendingNews();
  }
}
