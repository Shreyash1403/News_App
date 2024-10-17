// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:news_app/model/news_model.dart';
// import 'package:news_app/model/news_model2.dart';

// class NewsRepository {
//   Future<NewsModel> fetchNews() async {
//     final response = await http.get(Uri.parse(
//         "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=5a2aecf70adf4effbf6d810404a80470"));

//     if (response.statusCode == 200) {
//       return NewsModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }

//   Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi() async {
//     String url =
//         'https://newsapi.org/v2/top-headlines?sources=ary-news&apiKey=5a2aecf70adf4effbf6d810404a80470';
//     print(url);
//     final response = await http.get(Uri.parse(url));
//     if (kDebugMode) {
//       print(response.body);
//     }
//     if (response.statusCode == 200) {
//       final body = jsonDecode(response.body);
//       return NewsChannelsHeadlinesModel.fromJson(body);
//     }
//     throw Exception('Error');
//   }
// }

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/news_model.dart';

class NewsRepository {
  Future<NewsModel> fetchNews(String source) async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=5a2aecf70adf4effbf6d810404a80470"));

    if (kDebugMode) {
      print('Fetching news from: ${response.request?.url}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<CategoryModel> fetchCategoryNews(String category) async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$category&apiKey=5a2aecf70adf4effbf6d810404a80470'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoryModel.fromJson(body);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
