import 'package:flutter/material.dart';
import 'package:news_test_app/model/article.dart';

import 'widget/content_text.dart';
import 'widget/title_text.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: mq.padding.top, bottom: mq.padding.bottom, left: 8, right: 8),
        child: Column(
          children: [
            TitleText(title: article.title),
            const SizedBox(height: 8),
            ContentText(content: article.content),
          ],
        ),
      ),
    );
  }
}
