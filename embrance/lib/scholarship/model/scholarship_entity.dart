import 'package:embrance/generated/json/base/json_field.dart';
import 'package:embrance/generated/json/scholarship_entity.g.dart';
import 'dart:convert';
export 'package:embrance/generated/json/scholarship_entity.g.dart';

@JsonSerializable()
class ScholarshipEntity {
	late String id;
	late String title;
	late String description;
	late String award;
	late String deadline;
	@JSONField(name: "sc_link")
	late String scLink;
	@JSONField(name: "user_id")
	late String userId;
	@JSONField(name: "date_created")
	late String dateCreated;

	ScholarshipEntity();

	factory ScholarshipEntity.fromJson(Map<String, dynamic> json) => $ScholarshipEntityFromJson(json);

	Map<String, dynamic> toJson() => $ScholarshipEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}