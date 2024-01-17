import 'dart:convert';

import 'package:embrance/component/pageroute.dart';
import 'package:embrance/component/util.dart';
import 'package:embrance/profile/login/login_response_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../home/alumni_connect/model/alumni_response_entity.dart';
import '../network/RestAPI.dart';
import '../network/SocketConnection.dart';
import '../network/constants.dart';

class ProfileController extends GetxController{
  final SocketConnection socketConnection = Get.find<SocketConnection>();
  final RestAPI restAPI = Get.find<RestAPI>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var isDataLoading = false.obs;
  List<AlumniResponseEntity> useProfile = <AlumniResponseEntity>[].obs;
  final user = GetStorage();

  @override
  void onInit() {
    if(user.hasData("userID")) loadProfileData();
    super.onInit();
  }
  void loadProfileData(){
    loadProfile();
  }

  void loginAPI(BuildContext context) async {

    isDataLoading.value = true;
    FormData formData = FormData({
      'email': email.text,
      'password': password.text,
    });
    String response = await restAPI.postDataMethod(Constant.LOGIN,formData);
    var data =json.decode(response);
    LoginResponseEntity userData = LoginResponseEntity.fromJson(data);
    isDataLoading.value = false;

    if(userData.response.status==404){
      Util.showMessage(context, "Email or Password is wrong");
    }else {
      print("RESPONSE IS\n"+userData.response.user.name);

      user.write('username', userData.response.user.name);
      user.write('userID', userData.response.user.alumnusId);
      loadProfile();
      Get.toNamed(AppRoutes.DASHBOARD_ROUTE);
    }

  }

  void loadProfile() async {
    if(user!=null && user.hasData("userID")) {
      var header = { "accept": "application/json"};
      isDataLoading.value = true;
      String response = await restAPI.getDataMethod(
          Constant.PROFILE + "&current_user=${user.read("userID")}", header);
      var data = json.decode(response);
      useProfile = data.map<AlumniResponseEntity>((json) =>
          AlumniResponseEntity.fromJson(json)).toList();
      isDataLoading.value = false;
      print("PROFILE RESPONSE IS" + response);
    }
  }

  void removeData(){
    user.remove("username");
    user.remove("userID");
    socketConnection.disconnect();
    Get.offAllNamed(AppRoutes.LOGIN_ROUTE,);
    // Get.reset();
    // Get.toNamed(AppRoutes.LOGIN_ROUTE);
  }
}