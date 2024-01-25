import 'package:embrance/generated/json/base/json_field.dart';
import 'package:embrance/generated/json/jobs_entity.g.dart';
import 'dart:convert';
export 'package:embrance/generated/json/jobs_entity.g.dart';

@JsonSerializable()
class JobsEntity {
	@JSONField(name: "job_category")
	late String jobCategory;

	JobsEntity();

	factory JobsEntity.fromJson(Map<String, dynamic> json) => $JobsEntityFromJson(json);

	Map<String, dynamic> toJson() => $JobsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}