import 'package:embrance/generated/json/base/json_convert_content.dart';
import 'package:embrance/profile/model/course_entity.dart';

CourseEntity $CourseEntityFromJson(Map<String, dynamic> json) {
  final CourseEntity courseEntity = CourseEntity();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    courseEntity.id = id;
  }
  final String? course = jsonConvert.convert<String>(json['course']);
  if (course != null) {
    courseEntity.course = course;
  }
  return courseEntity;
}

Map<String, dynamic> $CourseEntityToJson(CourseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['course'] = entity.course;
  return data;
}

extension CourseEntityExtension on CourseEntity {
  CourseEntity copyWith({
    String? id,
    String? course,
  }) {
    return CourseEntity()
      ..id = id ?? this.id
      ..course = course ?? this.course;
  }
}