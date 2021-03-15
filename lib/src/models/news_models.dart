import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_provider/src/shared_prefs/user_preferences.dart';

NewsResponse newsResponseFromJson(String str) =>
    NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.favorite = Icons.star_outline_rounded});

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;
  IconData favorite;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
      source: Source.fromJson(json["source"]),
      author: json["author"] == null ? null : json["author"],
      title: json["title"],
      description: json["description"] == null ? null : json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"]),
      content: json["content"] == null ? null : json["content"],
      favorite: json["favorite"] == null
          ? _isFavorite(json["url"])
              ? Icons.star_rounded
              : Icons.star_outline_rounded
          : Icons.star_rounded);

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
        "favorite": favorite == Icons.star_outline_rounded ? false : true
      };

  static bool _isFavorite(String url) {
    final userPrefs = UserPreferences();
    return userPrefs.favorites.any((article) => article.url == url);
  }
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}
