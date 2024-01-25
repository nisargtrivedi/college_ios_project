import 'package:embrance/generated/json/base/json_convert_content.dart';
import 'package:embrance/scholarship/model/scholarship_entity.dart';

ScholarshipEntity $ScholarshipEntityFromJson(Map<String, dynamic> json) {
  final ScholarshipEntity scholarshipEntity = ScholarshipEntity();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    scholarshipEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    scholarshipEntity.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    scholarshipEntity.description = description;
  }
  final String? award = jsonConvert.convert<String>(json['award']);
  if (award != null) {
    scholarshipEntity.award = award;
  }
  final String? deadline = jsonConvert.convert<String>(json['deadline']);
  if (deadline != null) {
    scholarshipEntity.deadline = deadline;
  }
  final String? scLink = jsonConvert.convert<String>(json['sc_link']);
  if (scLink != null) {
    scholarshipEntity.scLink = scLink;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    scholarshipEntity.userId = userId;
  }
  final String? dateCreated = jsonConvert.convert<String>(json['date_created']);
  if (dateCreated != null) {
    scholarshipEntity.dateCreated = dateCreated;
  }
  return scholarshipEntity;
}

Map<String, dynamic> $ScholarshipEntityToJson(ScholarshipEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['award'] = entity.award;
  data['deadline'] = entity.deadline;
  data['sc_link'] = entity.scLink;
  data['user_id'] = entity.userId;
  data['date_created'] = entity.dateCreated;
  return data;
}

extension ScholarshipEntityExtension on ScholarshipEntity {
  ScholarshipEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? award,
    String? deadline,
    String? scLink,
    String? userId,
    String? dateCreated,
  }) {
    return ScholarshipEntity()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..award = award ?? this.award
      ..deadline = deadline ?? this.deadline
      ..scLink = scLink ?? this.scLink
      ..userId = userId ?? this.userId
      ..dateCreated = dateCreated ?? this.dateCreated;
  }
}