import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'http://newsapi.org/v2';
const _APIKEY = 'f25742f1cc624d78aca662eec1813ee1';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.memory, 'technology'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    categories.forEach((item) {
      categoryArticles[item.name] = [];
    });
  }

  get selectedCategory => _selectedCategory;
  get selectedCategoryArticles => categoryArticles[_selectedCategory];

  set selectedCategory(String category) {
    this._selectedCategory = category;
    this.getArticlesByCategory(category);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx&category=business');
    final response = await http.get(url);

    final newsResponse = newsResponseFromJson(response.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category].length > 0) {
      return categoryArticles[category];
    }

    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx&category=$category');
    final response = await http.get(url);

    final newsResponse = newsResponseFromJson(response.body);

    categoryArticles[category].addAll(newsResponse.articles);
    notifyListeners();
  }
}
