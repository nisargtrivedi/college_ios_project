import 'package:embrance/generated/json/base/json_convert_content.dart';
import 'package:embrance/profile/login/login_response_entity.dart';

LoginResponseEntity $LoginResponseEntityFromJson(Map<String, dynamic> json) {
  final LoginResponseEntity loginResponseEntity = LoginResponseEntity();
  final LoginResponseResponse? response = jsonConvert.convert<
      LoginResponseResponse>(json['response']);
  if (response != null) {
    loginResponseEntity.response = response;
  }
  return loginResponseEntity;
}

Map<String, dynamic> $LoginResponseEntityToJson(LoginResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['response'] = entity.response.toJson();
  return data;
}

extension LoginResponseEntityExtension on LoginResponseEntity {
  LoginResponseEntity copyWith({
    LoginResponseResponse? response,
  }) {
    return LoginResponseEntity()
      ..response = response ?? this.response;
  }
}

LoginResponseResponse $LoginResponseResponseFromJson(
    Map<String, dynamic> json) {
  final LoginResponseResponse loginResponseResponse = LoginResponseResponse();
  final LoginResponseResponseUser? user = jsonConvert.convert<
      LoginResponseResponseUser>(json['user']);
  if (user != null) {
    loginResponseResponse.user = user;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    loginResponseResponse.status = status;
  }
  return loginResponseResponse;
}

Map<String, dynamic> $LoginResponseResponseToJson(
    LoginResponseResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['user'] = entity.user.toJson();
  data['status'] = entity.status;
  return data;
}

extension LoginResponseResponseExtension on LoginResponseResponse {
  LoginResponseResponse copyWith({
    LoginResponseResponseUser? user,
    int? status,
  }) {
    return LoginResponseResponse()
      ..user = user ?? this.user
      ..status = status ?? this.status;
  }
}

LoginResponseResponseUser $LoginResponseResponseUserFromJson(
    Map<String, dynamic> json) {
  final LoginResponseResponseUser loginResponseResponseUser = LoginResponseResponseUser();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    loginResponseResponseUser.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    loginResponseResponseUser.name = name;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    loginResponseResponseUser.username = username;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    loginResponseResponseUser.password = password;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    loginResponseResponseUser.type = type;
  }
  final dynamic autoGeneratedPass = json['auto_generated_pass'];
  if (autoGeneratedPass != null) {
    loginResponseResponseUser.autoGeneratedPass = autoGeneratedPass;
  }
  final String? alumnusId = jsonConvert.convert<String>(json['alumnus_id']);
  if (alumnusId != null) {
    loginResponseResponseUser.alumnusId = alumnusId;
  }
  return loginResponseResponseUser;
}

Map<String, dynamic> $LoginResponseResponseUserToJson(
    LoginResponseResponseUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['username'] = entity.username;
  data['password'] = entity.password;
  data['type'] = entity.type;
  data['auto_generated_pass'] = entity.autoGeneratedPass;
  data['alumnus_id'] = entity.alumnusId;
  return data;
}

extension LoginResponseResponseUserExtension on LoginResponseResponseUser {
  LoginResponseResponseUser copyWith({
    String? id,
    String? name,
    String? username,
    String? password,
    String? type,
    dynamic autoGeneratedPass,
    String? alumnusId,
  }) {
    return LoginResponseResponseUser()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..username = username ?? this.username
      ..password = password ?? this.password
      ..type = type ?? this.type
      ..autoGeneratedPass = autoGeneratedPass ?? this.autoGeneratedPass
      ..alumnusId = alumnusId ?? this.alumnusId;
  }
}