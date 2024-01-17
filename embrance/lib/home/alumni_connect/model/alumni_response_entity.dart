import 'package:embrance/generated/json/base/json_field.dart';
import 'package:embrance/generated/json/alumni_response_entity.g.dart';
import 'dart:convert';
export 'package:embrance/generated/json/alumni_response_entity.g.dart';

@JsonSerializable()
class AlumniResponseEntity {
	@JSONField(name: "alu_id")
	late String aluId;
	@JSONField(name: "course_id")
	late String courseId;
	late String firstname;
	late String middlename;
	late String lastname;
	late String course;
	late String email;
	late String phone;
	@JSONField(name: "connected_to")
	late String connectedTo;
	late String avatar;
	late String gender;
	late String batch;
	late String type;
	late String skills;

	AlumniResponseEntity();

	factory AlumniResponseEntity.fromJson(Map<String, dynamic> json) => $AlumniResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $AlumniResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}