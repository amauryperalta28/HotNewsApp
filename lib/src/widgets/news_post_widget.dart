import 'package:flutter/material.dart';
import 'package:hotnewsapp/src/models/news_response.dart';

class NewsPostWidget extends StatelessWidget {
  final Article article;
  const NewsPostWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          // height: 300.0,
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: _ArticleImage(article: article),
                borderRadius: BorderRadius.circular(10.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                article.title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text('4 hours ago'),
                  SizedBox(width: 10.0),
                  Text('3 mins read'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticleImage extends StatelessWidget {
  const _ArticleImage({
    Key key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: (article.urlToImage != null)
          ? FadeInImage(
              placeholder: AssetImage('assets/images/Ajux_loader.gif'),
              image: NetworkImage(article.urlToImage),
              fit: BoxFit.cover,
            )
          : Image(
              image: AssetImage('assets/images/no-image-available.png'),
            ),
    );
  }
}
