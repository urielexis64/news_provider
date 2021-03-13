import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class BodyCard extends StatelessWidget {
  final Article news;
  final String noDescriptionText;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const BodyCard(this.news,
      {this.noDescriptionText = 'No hay descripción. 😕',
      this.textAlign = TextAlign.justify,
      this.fontWeight = FontWeight.w300});

  @override
  Widget build(BuildContext context) {
    return Text(
      news.description ?? noDescriptionText,
      textAlign: textAlign,
      style: TextStyle(fontWeight: fontWeight),
    );
  }
}
