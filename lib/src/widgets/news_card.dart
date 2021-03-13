import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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
    initializeDateFormatting();

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
              _DateCard(news)
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBarCard extends StatefulWidget {
  final Article news;
  final int index;

  const _TopBarCard({this.news, this.index});

  @override
  __TopBarCardState createState() => __TopBarCardState();
}

class __TopBarCardState extends State<_TopBarCard> {
  IconData _iconData = Icons.star_outline_rounded;

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
                '${widget.index + 1}',
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${widget.news.source.name}',
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(_iconData),
                onPressed: () {
                  setState(() {
                    _iconData = _iconData == Icons.star_outline_rounded
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded;
                  });
                }),
            Icon(Icons.arrow_forward_rounded)
          ],
        )
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

class _DateCard extends StatelessWidget {
  final Article news;

  const _DateCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(top: 10),
      child: Text(
        formatDate(news.publishedAt),
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  formatDate(DateTime date) {
    return DateFormat.yMMMEd('es_ES').format(date);
  }
}
