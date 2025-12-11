import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_article.freezed.dart';
part 'news_article.g.dart';

@freezed
class NewsArticle with _$NewsArticle {
  factory NewsArticle({
    required String id,
    required String headline,
    required String source,
    String? url,
    DateTime? datetime,
    String? summary,
  }) = _NewsArticle;

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);
}
