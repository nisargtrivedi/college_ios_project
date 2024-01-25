import 'package:embrance/generated/json/base/json_convert_content.dart';
import 'package:embrance/jobs/job_details_entity.dart';

JobDetailsEntity $JobDetailsEntityFromJson(Map<String, dynamic> json) {
  final JobDetailsEntity jobDetailsEntity = JobDetailsEntity();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    jobDetailsEntity.id = id;
  }
  final String? company = jsonConvert.convert<String>(json['company']);
  if (company != null) {
    jobDetailsEntity.company = company;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    jobDetailsEntity.location = location;
  }
  final String? jobTitle = jsonConvert.convert<String>(json['job_title']);
  if (jobTitle != null) {
    jobDetailsEntity.jobTitle = jobTitle;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    jobDetailsEntity.description = description;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    jobDetailsEntity.userId = userId;
  }
  final String? jobCategory = jsonConvert.convert<String>(json['job_category']);
  if (jobCategory != null) {
    jobDetailsEntity.jobCategory = jobCategory;
  }
  final String? jobType = jsonConvert.convert<String>(json['job_type']);
  if (jobType != null) {
    jobDetailsEntity.jobType = jobType;
  }
  final String? salaryMin = jsonConvert.convert<String>(json['salary_min']);
  if (salaryMin != null) {
    jobDetailsEntity.salaryMin = salaryMin;
  }
  final String? salaryMax = jsonConvert.convert<String>(json['salary_max']);
  if (salaryMax != null) {
    jobDetailsEntity.salaryMax = salaryMax;
  }
  final dynamic skills = json['skills'];
  if (skills != null) {
    jobDetailsEntity.skills = skills;
  }
  final String? noOfVacancy = jsonConvert.convert<String>(
      json['no_of_vacancy']);
  if (noOfVacancy != null) {
    jobDetailsEntity.noOfVacancy = noOfVacancy;
  }
  final String? expirationDate = jsonConvert.convert<String>(
      json['expiration_date']);
  if (expirationDate != null) {
    jobDetailsEntity.expirationDate = expirationDate;
  }
  final String? dateCreated = jsonConvert.convert<String>(json['date_created']);
  if (dateCreated != null) {
    jobDetailsEntity.dateCreated = dateCreated;
  }
  return jobDetailsEntity;
}

Map<String, dynamic> $JobDetailsEntityToJson(JobDetailsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['company'] = entity.company;
  data['location'] = entity.location;
  data['job_title'] = entity.jobTitle;
  data['description'] = entity.description;
  data['user_id'] = entity.userId;
  data['job_category'] = entity.jobCategory;
  data['job_type'] = entity.jobType;
  data['salary_min'] = entity.salaryMin;
  data['salary_max'] = entity.salaryMax;
  data['skills'] = entity.skills;
  data['no_of_vacancy'] = entity.noOfVacancy;
  data['expiration_date'] = entity.expirationDate;
  data['date_created'] = entity.dateCreated;
  return data;
}

extension JobDetailsEntityExtension on JobDetailsEntity {
  JobDetailsEntity copyWith({
    String? id,
    String? company,
    String? location,
    String? jobTitle,
    String? description,
    String? userId,
    String? jobCategory,
    String? jobType,
    String? salaryMin,
    String? salaryMax,
    dynamic skills,
    String? noOfVacancy,
    String? expirationDate,
    String? dateCreated,
  }) {
    return JobDetailsEntity()
      ..id = id ?? this.id
      ..company = company ?? this.company
      ..location = location ?? this.location
      ..jobTitle = jobTitle ?? this.jobTitle
      ..description = description ?? this.description
      ..userId = userId ?? this.userId
      ..jobCategory = jobCategory ?? this.jobCategory
      ..jobType = jobType ?? this.jobType
      ..salaryMin = salaryMin ?? this.salaryMin
      ..salaryMax = salaryMax ?? this.salaryMax
      ..skills = skills ?? this.skills
      ..noOfVacancy = noOfVacancy ?? this.noOfVacancy
      ..expirationDate = expirationDate ?? this.expirationDate
      ..dateCreated = dateCreated ?? this.dateCreated;
  }
}