import 'package:embrance/generated/json/base/json_field.dart';
import 'package:embrance/generated/json/course_entity.g.dart';
import 'dart:convert';
export 'package:embrance/generated/json/course_entity.g.dart';

@JsonSerializable()
class CourseEntity {
	late String id;
	late String course;

	CourseEntity();

	factory CourseEntity.fromJson(Map<String, dynamic> json) => $CourseEntityFromJson(json);

	Map<String, dynamic> toJson() => $CourseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}