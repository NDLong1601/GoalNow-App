import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/core/network/api_endpoint.dart';
import 'package:goalnow_app/model/news.dart';

class NewsService {
  final ApiClient _client;

  NewsService(this._client);

  Future<List<NewsModel>> getTrendingNews() async {
    final data = await _client.get(ApiEndpoint.trendingNews);

    final List list = data['response']['news'];
    return list.map((e) => NewsModel.fromJson(e)).toList();
  }
}
