import 'package:flutter/material.dart';
import 'package:news_test_app/model/article.dart';

import 'article_content_text.dart';
import 'article_title_text.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final VoidCallback onPressed;
  final double marginBottom;

  const ArticleTile({
    super.key,
    required this.article,
    required this.onPressed,
    required this.marginBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: marginBottom),
      child: ListTile(
        title: ArticleTitleText(title: article.title),
        subtitle: ArticleContentText(content: article.content),
        onTap: onPressed,
      ),
    );
  }
}
