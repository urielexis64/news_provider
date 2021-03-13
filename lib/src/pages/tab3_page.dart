import 'package:flutter/material.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class Tab3Page extends StatefulWidget {
  @override
  _Tab3PageState createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final favorites = newsService.favorites;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: NewsGrid(favorites),
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
