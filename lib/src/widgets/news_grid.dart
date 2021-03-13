import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/widgets/cards/favorite_news_card.dart';

class NewsGrid extends StatelessWidget {
  final List<Article> news;

  const NewsGrid(this.news);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
          mainAxisExtent: MediaQuery.of(context).size.height / 2.7),
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(
          news: news[index],
          index: index,
        );
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({@required this.news, @required this.index});

  @override
  Widget build(BuildContext context) {
    return FavoriteNewsCard(news: news, index: index);
  }
}
