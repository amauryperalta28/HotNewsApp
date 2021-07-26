import 'package:flutter/material.dart';
import 'package:hotnewsapp/src/pages/home_page.dart';
import 'package:hotnewsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new NewsService(),
        )
      ],
      child: MaterialApp(
        title: 'HotNewsApp',
        home: HomePage(),
      ),
    );
  }
}
