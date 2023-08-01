import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_test_app/model/article.dart';
import 'package:news_test_app/screen/article/article_screen.dart';
import 'package:news_test_app/screen/articles/articles_screen.dart';
import 'package:news_test_app/services/article_service.dart';
import 'package:news_test_app/view_models/article_vm.dart';
import 'package:provider/provider.dart';

class MockArticleService extends Mock implements ArticleService {}

void main() {
  late MockArticleService mockArticleService;

  setUp(() {
    mockArticleService = MockArticleService();
  });

  final articlesFromService = [
    const Article(title: "Title 1", content: "Content 1"),
    const Article(title: "Title 2", content: "Content 2"),
    const Article(title: "Title 3", content: "Content 3"),
  ];

  void arrangeArticleServiceReturns3Articles() {
    when(() => mockArticleService.getArticles()).thenAnswer(
      (_) async => articlesFromService,
    );
  }

  Widget createWidgetUnderTest() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ArticleVM(mockArticleService),
        child: const ArticlesScreen(),
      ),
    );
  }

  testWidgets(
    """tapping on the first article excerpt opens the article page
    where the full article content is displayed""",
    (WidgetTester tester) async {
      arrangeArticleServiceReturns3Articles();
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.text("Title 1"));
      await tester.pumpAndSettle();

      expect(find.byType(ArticlesScreen), findsNothing);
      expect(find.byType(ArticleScreen), findsOneWidget);

      expect(find.text("Title 1"), findsOneWidget);
    },
  );
}
