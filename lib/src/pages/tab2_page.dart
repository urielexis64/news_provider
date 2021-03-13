import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/widgets/news_list.dart';
import 'package:news_provider/src/widgets/category_card.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final List<Article> articles = newsService.selectedCategoryArticles;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            'Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Container(
              width: double.infinity, height: 90, child: _CategoriesList()),
          Expanded(
              child: articles.length == 0
                  ? Center(child: CircularProgressIndicator())
                  : NewsList(articles))
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final categories = newsService.categories;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryCard(categories[index]);
      },
    );
  }
}
