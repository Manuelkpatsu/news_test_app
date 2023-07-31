import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/articles/articles_screen.dart';
import 'services/article_service.dart';
import 'view_models/article_vm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ArticleVM(ArticleService()),
        child: const ArticlesScreen(),
      ),
    );
  }
}
