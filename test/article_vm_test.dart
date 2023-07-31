import 'package:flutter_test/flutter_test.dart';
import 'package:news_test_app/model/article.dart';
import 'package:news_test_app/services/article_service.dart';
import 'package:news_test_app/view_models/article_vm.dart';
import 'package:mocktail/mocktail.dart';

class MockArticleService extends Mock implements ArticleService {}

void main() {
  late ArticleVM sut;
  late MockArticleService mockArticleService;

  setUp(() {
    mockArticleService = MockArticleService();
    sut = ArticleVM(mockArticleService);
  });

  test(
    "initial values are correct",
    () {
      expect(sut.articles, []);
      expect(sut.isLoading, false);
    },
  );

  group(
    "get Articles",
    () {
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

      test(
        "gets articles using the ArticleService",
        () async {
          arrangeArticleServiceReturns3Articles();
          await sut.getArticles();
          verify(() => mockArticleService.getArticles()).called(1);
        },
      );

      test(
        """indicates loading of data,
        sets articles to the ones from the service,
        indicates that the data is not being loaded anymore""",
        () async {
          arrangeArticleServiceReturns3Articles();
          final future = sut.getArticles();
          expect(sut.isLoading, true);
          await future;
          expect(sut.articles, articlesFromService);
          expect(sut.isLoading, false);
        },
      );
    },
  );
}
