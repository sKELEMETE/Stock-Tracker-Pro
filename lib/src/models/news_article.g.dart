// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsArticleImpl _$$NewsArticleImplFromJson(Map<String, dynamic> json) =>
    _$NewsArticleImpl(
      id: json['id'] as String,
      headline: json['headline'] as String,
      source: json['source'] as String,
      url: json['url'] as String?,
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$$NewsArticleImplToJson(_$NewsArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'headline': instance.headline,
      'source': instance.source,
      'url': instance.url,
      'datetime': instance.datetime?.toIso8601String(),
      'summary': instance.summary,
    };
