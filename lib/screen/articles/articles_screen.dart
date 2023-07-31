import 'package:flutter/material.dart';
import 'package:news_test_app/screen/article/article_screen.dart';
import 'package:news_test_app/screen/widget/app_bar_title_text.dart';
import 'package:news_test_app/screen/widget/loader.dart';
import 'package:news_test_app/view_models/article_vm.dart';
import 'package:provider/provider.dart';

import 'widget/article_tile.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ArticleVM>().getArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const AppBarTitleText(title: 'News Articles'),
      ),
      body: Consumer<ArticleVM>(
        builder: (context, notifier, child) {
          if (notifier.isLoading) {
            return const Loader();
          }
          return ListView.builder(
            itemCount: notifier.articles.length,
            itemBuilder: (_, index) {
              final article = notifier.articles[index];

              return ArticleTile(
                article: article,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ArticleScreen(article: article),
                    ),
                  );
                },
                marginBottom: index == notifier.articles.length - 1 ? 0 : 5,
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          );
        },
      ),
    );
  }
}
