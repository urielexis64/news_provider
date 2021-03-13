import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_provider/src/models/news_models.dart';

class DateCard extends StatelessWidget {
  final Article news;
  final double fontSize;
  final Color textColor;
  final String locale;
  final TextOverflow overflow;

  const DateCard(this.news,
      {this.fontSize = 12,
      this.textColor = Colors.grey,
      this.locale = 'es_ES',
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(top: 10),
      child: Text(
        formatDate(news.publishedAt),
        overflow: overflow ?? null,
        style: TextStyle(color: textColor, fontSize: fontSize),
      ),
    );
  }

  formatDate(DateTime date) {
    return DateFormat.yMMMEd(locale).format(date);
  }
}
