import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'http://newsapi.org/v2';
const _APIKEY = 'f25742f1cc624d78aca662eec1813ee1';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx&category=business');
    final response = await http.get(url);

    final newsResponse = newsResponseFromJson(response.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
