import 'package:embrance/generated/json/base/json_field.dart';
import 'package:embrance/generated/json/job_details_entity.g.dart';
import 'dart:convert';
export 'package:embrance/generated/json/job_details_entity.g.dart';

@JsonSerializable()
class JobDetailsEntity {
	late String id;
	late String company;
	late String location;
	@JSONField(name: "job_title")
	late String jobTitle;
	late String description;
	@JSONField(name: "user_id")
	late String userId;
	@JSONField(name: "job_category")
	late String jobCategory;
	@JSONField(name: "job_type")
	late String jobType;
	@JSONField(name: "salary_min")
	late String salaryMin;
	@JSONField(name: "salary_max")
	late String salaryMax;
	dynamic skills;
	@JSONField(name: "no_of_vacancy")
	late String noOfVacancy;
	@JSONField(name: "expiration_date")
	late String expirationDate;
	@JSONField(name: "date_created")
	late String dateCreated;

	JobDetailsEntity();

	factory JobDetailsEntity.fromJson(Map<String, dynamic> json) => $JobDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => $JobDetailsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}