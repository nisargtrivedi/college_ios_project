// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:embrance/home/alumni_connect/model/alumni_response_entity.dart';
import 'package:embrance/home/alumni_connect/model/message_chat_entity.dart';
import 'package:embrance/jobs/job_details_entity.dart';
import 'package:embrance/jobs/jobs_entity.dart';
import 'package:embrance/news/model/news_entity_entity.dart';
import 'package:embrance/profile/login/login_response_entity.dart';
import 'package:embrance/profile/model/course_entity.dart';
import 'package:embrance/scholarship/model/scholarship_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(value as Map<String, dynamic>) as T;
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<AlumniResponseEntity>[] is M) {
      return data.map<AlumniResponseEntity>((Map<String, dynamic> e) =>
          AlumniResponseEntity.fromJson(e)).toList() as M;
    }
    if (<MessageChatEntity>[] is M) {
      return data.map<MessageChatEntity>((Map<String, dynamic> e) =>
          MessageChatEntity.fromJson(e)).toList() as M;
    }
    if (<JobDetailsEntity>[] is M) {
      return data.map<JobDetailsEntity>((Map<String, dynamic> e) =>
          JobDetailsEntity.fromJson(e)).toList() as M;
    }
    if (<JobsEntity>[] is M) {
      return data.map<JobsEntity>((Map<String, dynamic> e) =>
          JobsEntity.fromJson(e)).toList() as M;
    }
    if (<NewsEntityEntity>[] is M) {
      return data.map<NewsEntityEntity>((Map<String, dynamic> e) =>
          NewsEntityEntity.fromJson(e)).toList() as M;
    }
    if (<NewsEntityArticles>[] is M) {
      return data.map<NewsEntityArticles>((Map<String, dynamic> e) =>
          NewsEntityArticles.fromJson(e)).toList() as M;
    }
    if (<LoginResponseEntity>[] is M) {
      return data.map<LoginResponseEntity>((Map<String, dynamic> e) =>
          LoginResponseEntity.fromJson(e)).toList() as M;
    }
    if (<LoginResponseResponse>[] is M) {
      return data.map<LoginResponseResponse>((Map<String, dynamic> e) =>
          LoginResponseResponse.fromJson(e)).toList() as M;
    }
    if (<LoginResponseResponseUser>[] is M) {
      return data.map<LoginResponseResponseUser>((Map<String, dynamic> e) =>
          LoginResponseResponseUser.fromJson(e)).toList() as M;
    }
    if (<CourseEntity>[] is M) {
      return data.map<CourseEntity>((Map<String, dynamic> e) =>
          CourseEntity.fromJson(e)).toList() as M;
    }
    if (<ScholarshipEntity>[] is M) {
      return data.map<ScholarshipEntity>((Map<String, dynamic> e) =>
          ScholarshipEntity.fromJson(e)).toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (AlumniResponseEntity).toString(): AlumniResponseEntity.fromJson,
    (MessageChatEntity).toString(): MessageChatEntity.fromJson,
    (JobDetailsEntity).toString(): JobDetailsEntity.fromJson,
    (JobsEntity).toString(): JobsEntity.fromJson,
    (NewsEntityEntity).toString(): NewsEntityEntity.fromJson,
    (NewsEntityArticles).toString(): NewsEntityArticles.fromJson,
    (LoginResponseEntity).toString(): LoginResponseEntity.fromJson,
    (LoginResponseResponse).toString(): LoginResponseResponse.fromJson,
    (LoginResponseResponseUser).toString(): LoginResponseResponseUser.fromJson,
    (CourseEntity).toString(): CourseEntity.fromJson,
    (ScholarshipEntity).toString(): ScholarshipEntity.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}