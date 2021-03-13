import 'package:news_provider/src/models/news_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<Article> get favorites {
    final news = _prefs.getString('favorites');

    if (news == null) return [];

    return (json.decode(news) as List<dynamic>)
        .map<Article>((article) => Article.fromJson(article))
        .toList();
  }

  set favorites(List<Article> articles) {
    final news = json.encode(
      articles
          .map<Map<String, dynamic>>((article) => article.toJson())
          .toList(),
    );

    _prefs.setString('favorites', news);
  }
}
