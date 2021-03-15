import 'package:flutter/material.dart';
import 'package:news_provider/Constants.dart';
import 'package:news_provider/src/models/news_models.dart';

class ImageCard extends StatelessWidget {
  final Article news;
  final double verticalPadding;
  final String placeholderPath;
  final String noImagePath;
  final double height;

  const ImageCard(this.news,
      {this.verticalPadding = 8,
      this.placeholderPath = 'assets/images/giphy.gif',
      this.noImagePath = 'assets/images/no-image.png',
      this.height});

  @override
  Widget build(BuildContext context) {
    final safeUrlImage = (news.urlToImage != null)
        ? news.urlToImage.startsWith('http')
            ? news.urlToImage
            : 'https:${news.urlToImage}'
        : null;

    return Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Constants.defaultBorderRadius),
          child: (safeUrlImage != null)
              ? FadeInImage(
                  height: height ?? null,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage(placeholderPath),
                  image: NetworkImage(safeUrlImage))
              : Image(image: AssetImage(noImagePath)),
        ));
  }
}
