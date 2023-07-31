import 'package:flutter/material.dart';

class AppBarTitleText extends StatelessWidget {
  final String title;

  const AppBarTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
