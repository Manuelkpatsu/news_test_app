import 'package:flutter/material.dart';

class ArticleContentText extends StatelessWidget {
  final String content;

  const ArticleContentText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(content, maxLines: 4, overflow: TextOverflow.ellipsis);
  }
}
