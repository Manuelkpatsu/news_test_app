import 'package:flutter/material.dart';
import 'package:news_test_app/model/article.dart';
import 'package:news_test_app/services/article_service.dart';

class ArticleVM extends ChangeNotifier {
  final ArticleService _articleService;

  ArticleVM(this._articleService);

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getArticles() async {
    _isLoading = true;
    notifyListeners();
    _articles = await _articleService.getArticles();
    _isLoading = false;
    notifyListeners();
  }
}
