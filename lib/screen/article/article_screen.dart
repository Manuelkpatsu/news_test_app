import 'package:flutter/material.dart';
import 'package:news_test_app/model/article.dart';

import 'widget/content_text.dart';
import 'widget/title_text.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TitleText(title: article.title),
              const SizedBox(height: 8),
              ContentText(content: article.content),
            ],
          ),
        ),
      ),
    );
  }
}
