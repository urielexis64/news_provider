import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:news_provider/Constants.dart';
import 'package:news_provider/src/models/news_models.dart';

import 'package:news_provider/src/widgets/cards/cards_components/topbar_card.dart';
import 'package:news_provider/src/widgets/cards/cards_components/title_card.dart';
import 'package:news_provider/src/widgets/cards/cards_components/image_card.dart';
import 'package:news_provider/src/widgets/cards/cards_components/date_card.dart';

class FavoriteNewsCard extends StatelessWidget {
  const FavoriteNewsCard({
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.defaultBorderRadius)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, 'webview', arguments: news),
        child: Padding(
          padding: EdgeInsets.all(Constants.defaultPadding),
          child: Column(
            children: [
              TopBarCard(
                news,
                index,
                arrow: false,
              ),
              TitleCard(
                news,
                fontSize: 14,
                maxLines: 3,
                horizontalPadding: 0,
                overflow: TextOverflow.ellipsis,
              ),
              ImageCard(
                news,
                height: 80,
              ),
              DateCard(news)
            ],
          ),
        ),
      ),
    );
  }
}
