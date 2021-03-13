import 'package:flutter/material.dart';
import 'package:news_provider/Constants.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TopBarCard extends StatefulWidget {
  final Article news;
  final int index;
  final bool arrow;

  const TopBarCard(this.news, this.index, {this.arrow = true});

  @override
  _TopBarCardState createState() => _TopBarCardState();
}

class _TopBarCardState extends State<TopBarCard> {
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
            widget.arrow
                ? Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${widget.news.source.name}',
                      )
                    ],
                  )
                : Container()
          ],
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(widget.news.favorite),
                onPressed: () {
                  final newsService =
                      Provider.of<NewsService>(context, listen: false);
                  setState(() {
                    if (widget.news.favorite == Icons.star_outline_rounded) {
                      widget.news.favorite = Icons.star_rounded;
                      newsService.addFavorite(widget.news);
                    } else {
                      widget.news.favorite = Icons.star_outline_rounded;
                      newsService.removeFavorite(widget.news);
                    }
                  });
                }),
            widget.arrow ? Icon(Icons.arrow_forward_rounded) : Container()
          ],
        )
      ],
    );
  }
}
