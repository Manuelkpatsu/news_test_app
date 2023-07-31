import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String content;

  const Article({required this.title, required this.content});

  Article copyWith({String? title, String? content}) {
    return Article(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  List<Object?> get props => [title, content];
}
