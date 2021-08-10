// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    status: json['status'] as String,
    totalResults: json['totalResults'] as int,
    articles: (json['articles'] as List<dynamic>)
        .map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    source: ArticleSource.fromJson(json['source'] as Map<String, dynamic>),
    author: json['author'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    urlToImage: json['urlToImage'] as String,
    publishedAt: json['publishedAt'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

ArticleSource _$ArticleSourceFromJson(Map<String, dynamic> json) {
  return ArticleSource(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ArticleSourceToJson(ArticleSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Sources _$SourcesFromJson(Map<String, dynamic> json) {
  return Sources(
    status: json['status'] as String,
    sources: (json['sources'] as List<dynamic>)
        .map((e) => Source.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'status': instance.status,
      'sources': instance.sources,
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    category: json['category'] as String,
    language: json['language'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };
