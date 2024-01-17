import 'package:embrance/generated/json/base/json_convert_content.dart';
import 'package:embrance/news/model/news_entity_entity.dart';

NewsEntityEntity $NewsEntityEntityFromJson(Map<String, dynamic> json) {
  final NewsEntityEntity newsEntityEntity = NewsEntityEntity();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    newsEntityEntity.status = status;
  }
  final int? totalResults = jsonConvert.convert<int>(json['totalResults']);
  if (totalResults != null) {
    newsEntityEntity.totalResults = totalResults;
  }
  final List<NewsEntityArticles>? articles = (json['articles'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<NewsEntityArticles>(e) as NewsEntityArticles)
      .toList();
  if (articles != null) {
    newsEntityEntity.articles = articles;
  }
  return newsEntityEntity;
}

Map<String, dynamic> $NewsEntityEntityToJson(NewsEntityEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['totalResults'] = entity.totalResults;
  data['articles'] = entity.articles.map((v) => v.toJson()).toList();
  return data;
}

extension NewsEntityEntityExtension on NewsEntityEntity {
  NewsEntityEntity copyWith({
    String? status,
    int? totalResults,
    List<NewsEntityArticles>? articles,
  }) {
    return NewsEntityEntity()
      ..status = status ?? this.status
      ..totalResults = totalResults ?? this.totalResults
      ..articles = articles ?? this.articles;
  }
}

NewsEntityArticles $NewsEntityArticlesFromJson(Map<String, dynamic> json) {
  final NewsEntityArticles newsEntityArticles = NewsEntityArticles();
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    newsEntityArticles.author = author;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    newsEntityArticles.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    newsEntityArticles.description = description;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    newsEntityArticles.url = url;
  }
  if(json['urlToImage']!=null) {
    final String? urlToImage = jsonConvert.convert<String>(json['urlToImage']);
    if (urlToImage != null) {
      newsEntityArticles.urlToImage = urlToImage;
    }
  }else {
    newsEntityArticles.urlToImage = "https://upload.wikimedia.org/wikipedia/commons/f/f8/No-image-available-4X3.png";
  }

  final String? publishedAt = jsonConvert.convert<String>(json['publishedAt']);
  if (publishedAt != null) {
    newsEntityArticles.publishedAt = publishedAt;
  }
  return newsEntityArticles;
}

Map<String, dynamic> $NewsEntityArticlesToJson(NewsEntityArticles entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['author'] = entity.author;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['url'] = entity.url;
  data['urlToImage'] = entity.urlToImage;
  data['publishedAt'] = entity.publishedAt;
  return data;
}

extension NewsEntityArticlesExtension on NewsEntityArticles {
  NewsEntityArticles copyWith({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
  }) {
    return NewsEntityArticles()
      ..author = author ?? this.author
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..url = url ?? this.url
      ..urlToImage = urlToImage ?? this.urlToImage
      ..publishedAt = publishedAt ?? this.publishedAt;
  }
}