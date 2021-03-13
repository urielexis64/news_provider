import 'package:flutter/material.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final headlines = newsService.headlines;
    return Scaffold(
        body: headlines.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NewsList(headlines));
  }
}
