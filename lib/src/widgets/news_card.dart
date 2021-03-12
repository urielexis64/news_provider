import 'package:flutter/material.dart';
import 'package:news_provider/Constants.dart';
import 'package:news_provider/src/models/news_models.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    @required this.news,
    @required this.index,
  }) : super(key: key);

  final Article news;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      margin: EdgeInsets.symmetric(
          horizontal: Constants.defaultMargin,
          vertical: Constants.defaultMargin / 2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.defaultBorderRadius)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, 'webview', arguments: news),
        child: Padding(
          padding: EdgeInsets.all(Constants.defaultPadding),
          child: Column(
            children: [
              _TopBarCard(news: news, index: index),
              _TitleCard(news),
              _ImageCard(news),
              Divider(),
              _BodyCard(news),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article news;
  final int index;

  const _TopBarCard({this.news, this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(Constants.defaultPadding * .75),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: Text(
                '${index + 1}',
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${news.source.name}',
            ),
          ],
        ),
        Icon(Icons.arrow_forward_rounded)
      ],
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article news;

  const _TitleCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        news.title ?? 'Sin título',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article news;

  const _ImageCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: (news.urlToImage != null)
              ? FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/giphy.gif'),
                  image: NetworkImage(news.urlToImage))
              : Image(image: AssetImage('assets/images/no-image.png')),
        ));
  }
}

class _BodyCard extends StatelessWidget {
  final Article news;

  const _BodyCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Text(
      news.description ?? 'No hay descripción. 😕',
      textAlign: TextAlign.justify,
      style: TextStyle(fontWeight: FontWeight.w300),
    );
  }
}
