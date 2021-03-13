import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class TitleCard extends StatelessWidget {
  final Article news;
  final double horizontalPadding;
  final String noTitleText;
  final double fontSize;
  final int maxLines;
  final TextOverflow overflow;

  const TitleCard(this.news,
      {this.fontSize = 20,
      this.noTitleText = 'Sin título',
      this.horizontalPadding = 10,
      this.maxLines,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Text(
        news.title ?? noTitleText,
        maxLines: maxLines ?? null,
        overflow: overflow ?? null,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
