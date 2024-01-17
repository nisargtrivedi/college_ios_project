import 'package:embrance/generated/json/base/json_convert_content.dart';
import 'package:embrance/home/alumni_connect/model/alumni_response_entity.dart';

AlumniResponseEntity $AlumniResponseEntityFromJson(Map<String, dynamic> json) {
  final AlumniResponseEntity alumniResponseEntity = AlumniResponseEntity();
  final String? aluId = jsonConvert.convert<String>(json['alu_id']);
  if (aluId != null) {
    alumniResponseEntity.aluId = aluId;
  }
  final String? courseId = jsonConvert.convert<String>(json['course_id']);
  if (courseId != null) {
    alumniResponseEntity.courseId = courseId;
  }
  final String? firstname = jsonConvert.convert<String>(json['firstname']);
  if (firstname != null) {
    alumniResponseEntity.firstname = firstname;
  }
  final String? middlename = jsonConvert.convert<String>(json['middlename']);
  if (middlename != null) {
    alumniResponseEntity.middlename = middlename;
  }
  final String? lastname = jsonConvert.convert<String>(json['lastname']);
  if (lastname != null) {
    alumniResponseEntity.lastname = lastname;
  }
  final String? course = jsonConvert.convert<String>(json['course']);
  if (course != null) {
    alumniResponseEntity.course = course;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    alumniResponseEntity.email = email;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    alumniResponseEntity.phone = phone;
  }
  final String? connectedTo = jsonConvert.convert<String>(json['connected_to']);
  if (connectedTo != null) {
    alumniResponseEntity.connectedTo = connectedTo;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    alumniResponseEntity.avatar = avatar;
  }
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    alumniResponseEntity.gender = gender;
  }
  final String? batch = jsonConvert.convert<String>(json['batch']);
  if (batch != null) {
    alumniResponseEntity.batch = batch;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    alumniResponseEntity.type = type;
  }
  final String? skills = jsonConvert.convert<String>(json['skills']);
  if (skills != null) {
    alumniResponseEntity.skills = skills;
  }
  return alumniResponseEntity;
}

Map<String, dynamic> $AlumniResponseEntityToJson(AlumniResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alu_id'] = entity.aluId;
  data['course_id'] = entity.courseId;
  data['firstname'] = entity.firstname;
  data['middlename'] = entity.middlename;
  data['lastname'] = entity.lastname;
  data['course'] = entity.course;
  data['email'] = entity.email;
  data['phone'] = entity.phone;
  data['connected_to'] = entity.connectedTo;
  data['avatar'] = entity.avatar;
  data['gender'] = entity.gender;
  data['batch'] = entity.batch;
  data['type'] = entity.type;
  data['skills'] = entity.skills;
  return data;
}

extension AlumniResponseEntityExtension on AlumniResponseEntity {
  AlumniResponseEntity copyWith({
    String? aluId,
    String? courseId,
    String? firstname,
    String? middlename,
    String? lastname,
    String? course,
    String? email,
    String? phone,
    String? connectedTo,
    String? avatar,
    String? gender,
    String? batch,
    String? type,
    String? skills,
  }) {
    return AlumniResponseEntity()
      ..aluId = aluId ?? this.aluId
      ..courseId = courseId ?? this.courseId
      ..firstname = firstname ?? this.firstname
      ..middlename = middlename ?? this.middlename
      ..lastname = lastname ?? this.lastname
      ..course = course ?? this.course
      ..email = email ?? this.email
      ..phone = phone ?? this.phone
      ..connectedTo = connectedTo ?? this.connectedTo
      ..avatar = avatar ?? this.avatar
      ..gender = gender ?? this.gender
      ..batch = batch ?? this.batch
      ..type = type ?? this.type
      ..skills = skills ?? this.skills;
  }
}