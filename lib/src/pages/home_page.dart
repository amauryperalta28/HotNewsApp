import 'package:flutter/material.dart';
import 'package:hotnewsapp/src/models/news_response.dart';
import 'package:hotnewsapp/src/services/news_service.dart';
import 'package:hotnewsapp/src/widgets/category_widget.dart';
import 'package:hotnewsapp/src/widgets/news_post_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsService>(context);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _CategoriesTopBar(),
          SizedBox(height: 5.0),
          Expanded(
            child: FutureBuilder<NewsResponse>(
                future: provider.getNewsByCategory(),
                builder: (BuildContext context,
                    AsyncSnapshot<NewsResponse> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Container(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator()
                        ),
                    );
                  }

                  final articles = snapshot.data.articles;

                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return NewsPostWidget(articles[index]);
                      },
                      itemCount: articles.length);
                }),
          )
        ],
      ),
    ));
  }
}

class _CategoriesTopBar extends StatefulWidget {
  const _CategoriesTopBar({
    Key key,
  }) : super(key: key);

  @override
  __CategoriesTopBarState createState() => __CategoriesTopBarState();
}

class __CategoriesTopBarState extends State<_CategoriesTopBar> {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: true);

    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newsService.categories.length ,
          itemBuilder: (context, index) {
            return new CategoryWidget(
              title:
                  "${newsService.categories[index][0].toUpperCase()}${newsService.categories[index].substring(1)}",
              isSelected:
                  newsService.selectedCategory == newsService.categories[index],
              value: newsService.categories[index],
            );
 
     

          }),
    );
  }
}
