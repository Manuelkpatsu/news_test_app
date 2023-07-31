import 'package:flutter/material.dart';

class ArticleTitleText extends StatelessWidget {
  final String title;

  const ArticleTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
