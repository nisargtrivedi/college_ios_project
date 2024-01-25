import 'package:embrance/generated/json/base/json_convert_content.dart';
import 'package:embrance/jobs/jobs_entity.dart';

JobsEntity $JobsEntityFromJson(Map<String, dynamic> json) {
  final JobsEntity jobsEntity = JobsEntity();
  final String? jobCategory = jsonConvert.convert<String>(json['job_category']);
  if (jobCategory != null) {
    jobsEntity.jobCategory = jobCategory;
  }
  return jobsEntity;
}

Map<String, dynamic> $JobsEntityToJson(JobsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['job_category'] = entity.jobCategory;
  return data;
}

extension JobsEntityExtension on JobsEntity {
  JobsEntity copyWith({
    String? jobCategory,
  }) {
    return JobsEntity()
      ..jobCategory = jobCategory ?? this.jobCategory;
  }
}