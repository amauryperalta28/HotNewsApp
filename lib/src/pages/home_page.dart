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
                future: provider.getNews(),
                builder: (BuildContext context,
                    AsyncSnapshot<NewsResponse> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
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

class _CategoriesTopBar extends StatelessWidget {
  const _CategoriesTopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 10.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryWidget(
            title: 'Business',
            isSelected: true,
          ),
          CategoryWidget(title: 'Business'),
          CategoryWidget(title: 'Business'),
          CategoryWidget(title: 'Business'),
          CategoryWidget(title: 'Business'),
          CategoryWidget(title: 'Business'),
          CategoryWidget(title: 'Business'),
        ],
      ),
    );
  }
}
