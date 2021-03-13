import 'package:flutter/material.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final articles = newsService.headlines;
    return Scaffold(
        body: articles.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NewsList(articles));
  }

  @override
  bool get wantKeepAlive => true;
}
