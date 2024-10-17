// import 'package:flutter/material.dart';
// import 'package:news_app/model/news_model.dart';
// import 'package:news_app/repository/news_repository.dart';

// class NewsViewModel extends ChangeNotifier {
//   final NewsRepository _repository = NewsRepository();
//   NewsModel? _newsModel;

//   Future<NewsModel> fetchNews() async {
//     _newsModel = await _repository.fetchNews();
//     notifyListeners();
//     return _newsModel!;
//   }

//   NewsModel? get newsModel => _newsModel;
// }

// class NewsChannelsHeadlinesModel extends ChangeNotifier {
//   final NewsChannelsHeadlinesModel _repository = NewsChannelsHeadlinesModel();
//   NewsChannelsHeadlinesModel? _newsChannelsHeadlinesModel;

//   Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi() async {
//     _newsChannelsHeadlinesModel =
//         await _repository.fetchNewChannelHeadlinesApi();
//     notifyListeners();
//     return _newsChannelsHeadlinesModel!;
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();
  NewsModel? _newsModel;
  String _currentSource = 'bbc-news';
  Future<NewsModel> fetchNews(String source) async {
    _newsModel = await _repository.fetchNews(source);
    notifyListeners();
    return _newsModel!;
  }

  void setNewsSource(String source) {
    _currentSource = source;
    fetchNews(source);
  }

  NewsModel? get newsModel => _newsModel;
  String get currentSource => _currentSource;

//Category ViewModel

  CategoryModel? _categoryModel;

  Future<CategoryModel> fetchCategoryNews(String category) async {
    _categoryModel = await _repository.fetchCategoryNews(category);
    notifyListeners();
    return _categoryModel!;
  }

  CategoryModel? get categoryModel => _categoryModel;
}
