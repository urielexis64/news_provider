import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/widgets/news_card.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          return false;
        },
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: news.length,
          itemBuilder: (BuildContext context, int index) {
            return _News(
              news: news[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({@required this.news, @required this.index});

  @override
  Widget build(BuildContext context) {
    return NewsCard(news: news, index: index);
  }
}
