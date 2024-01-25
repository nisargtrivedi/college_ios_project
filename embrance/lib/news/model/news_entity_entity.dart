import 'package:embrance/generated/json/base/json_field.dart';
import 'package:embrance/generated/json/news_entity_entity.g.dart';
import 'dart:convert';
export 'package:embrance/generated/json/news_entity_entity.g.dart';

@JsonSerializable()
class NewsEntityEntity {
	late String status;
	late int totalResults;
	late List<NewsEntityArticles> articles;

	NewsEntityEntity();

	factory NewsEntityEntity.fromJson(Map<String, dynamic> json) => $NewsEntityEntityFromJson(json);

	Map<String, dynamic> toJson() => $NewsEntityEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NewsEntityArticles {
	late String author;
	late String title;
	late String description;
	late String url;
	String urlToImage="https://demofree.sirv.com/products/123456/123456.jpg?profile=error-example";
	late String publishedAt;

	NewsEntityArticles();

	factory NewsEntityArticles.fromJson(Map<String, dynamic> json) => $NewsEntityArticlesFromJson(json);

	Map<String, dynamic> toJson() => $NewsEntityArticlesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}