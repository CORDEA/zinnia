import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class News {
  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Article> articles;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final ArticleSource source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class ArticleSource {
  ArticleSource({
    required this.id,
    required this.name,
  });

  final String? id;
  final String name;

  factory ArticleSource.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleSourceToJson(this);
}

@JsonSerializable()
class Sources {
  Sources({
    required this.status,
    required this.sources,
  });

  final String status;
  final List<Source> sources;

  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesToJson(this);
}

@JsonSerializable()
class Source {
  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
