import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:news_provider/Constants.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/widgets/cards/cards_components/date_card.dart';
import 'package:news_provider/src/widgets/cards/cards_components/title_card.dart';
import 'package:news_provider/src/widgets/cards/cards_components/body_card.dart';
import 'package:news_provider/src/widgets/cards/cards_components/image_card.dart';
import 'package:news_provider/src/widgets/cards/cards_components/topbar_card.dart';

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
              TopBarCard(news, index),
              TitleCard(news),
              ImageCard(news),
              Divider(),
              BodyCard(news),
              DateCard(news)
            ],
          ),
        ),
      ),
    );
  }
}
