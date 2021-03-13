import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_provider/Constants.dart';
import 'package:news_provider/src/theme/theme.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/services/news_service.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    final String capitalizedName =
        category.name[0].toUpperCase() + category.name.substring(1);

    return Card(
      margin: EdgeInsets.all(Constants.smallMargin),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.defaultBorderRadius)),
      child: InkWell(
        onTap: () {
          final newsService = Provider.of<NewsService>(context, listen: false);
          newsService.selectedCategory = category.name;
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                color: newsService.selectedCategory == category.name
                    ? MyTheme.myTheme.accentColor
                    : Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text(capitalizedName)
            ],
          ),
        ),
      ),
    );
  }
}
