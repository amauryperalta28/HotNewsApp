import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hotnewsapp/src/models/news_response.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  final String _apiKey = '95a1e58a10324fab8e5c3f34b2183fbf';

  final List<String> categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology",
  ];

  String _selectedCategory = 'entertainment';

  get selectedCategory {
    return _selectedCategory;
  }

  set selectedCategory(String category) {
    _selectedCategory = category;
    // getNewsByCategory();
    notifyListeners();
  }

  Future<NewsResponse> getNews() async {
    String url = '$_baseUrl?apiKey=$_apiKey&country=us';
    final response1 = await http.get(url);

    final decodedResponse = json.decode(response1.body);

    return NewsResponse.fromJson(decodedResponse);
  }

  Future<NewsResponse> getNewsByCategory() async {
    String url =
        '$_baseUrl?apiKey=$_apiKey&country=us&category=$_selectedCategory';
    final response1 = await http.get(url);

    final decodedResponse = json.decode(response1.body);

    return NewsResponse.fromJson(decodedResponse);
  }
}
