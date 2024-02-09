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
import 'model/course_entity.dart';

class ProfileController extends GetxController{
  final SocketConnection socketConnection = Get.find<SocketConnection>();
  final RestAPI restAPI = Get.find<RestAPI>();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController skills = TextEditingController();
  var course = "".obs;
  var alumni_student = "".obs;
  var enroll_year = "".obs;
  TextEditingController password = TextEditingController();
  List<String> typelist = ["Alumni","Student"];
  List<String> aluenrollmentYear = ["2004-2008","2008-2012","2012-2016","2016-2020","2020-2024"];
  List<String> currentenrollmentYear = ["2024-2028"];


  var isDataLoading = false.obs;
  List<AlumniResponseEntity> useProfile = <AlumniResponseEntity>[].obs;
  List<CourseEntity> courseList = <CourseEntity>[].obs;
  final user = GetStorage();

  @override
  void onInit() {
    if(user.hasData("userID")) loadProfileData();
    loadCourse();
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
    }else if(userData.response.status==401){
      Util.showMessage(context, "Your account is not approved yet.Please contact admin person.");
    }else {
      print("RESPONSE IS\n"+userData.response.user.name);
      socketConnection.connect(userData.response.user.alumnusId);
      var userTypes = userData.response.user.batch.split("-");
      var type ="";
      if(userTypes[0]=="2024"){
        type="1";  //CURRENT USER
      }
      else if(userTypes[0]=="2020"){
        type="2"; // SENIOR USER
      }else{
        type="3"; // ALUMNI
      }

      user.write('username', userData.response.user.name);
      user.write('userID', userData.response.user.alumnusId);
      user.write('user_type', type);
      user.write('gender', userData.response.user.gender);
      user.write('batch', userData.response.user.batch);

      loadProfile();
      if(type=="3"){
          Future.delayed(3.seconds,(){
            Get.offAllNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE,arguments: 1);
          });
      }if(userData.response.user.gender=="Male"){
        Future.delayed(3.seconds,(){
          Get.offAllNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE,arguments: 1);
        });
      }else{
        Get.offAllNamed(AppRoutes.DASHBOARD_ROUTE,);
      }

    }

  }

  String userType(){
    return user.read("user_type");
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

  void loadCourse() async {
      var header = { "accept": "application/json"};
      isDataLoading.value = true;
      String response = await restAPI.getDataMethod(
          Constant.GET_ALL_COURSE, header);
      print("COURSE RESPONSE IS" + response);
      var data = json.decode(response);
      courseList = data.map<CourseEntity>((json) =>
          CourseEntity.fromJson(json)).toList();
      isDataLoading.value = false;


  }


  void removeData(){
    user.remove("username");
    user.remove("userID");
    socketConnection.disconnect();
    Get.offAllNamed(AppRoutes.LOGIN_ROUTE,);
    // Get.reset();
    // Get.toNamed(AppRoutes.LOGIN_ROUTE);
  }

  void registrationAPI(BuildContext context) async {

    isDataLoading.value = true;
    FormData formData = FormData({
      'email': email.text,
      'password': password.text,
      'firstname': firstName.text,
      'lastname': lastName.text,
      'course': course.value,
      'phone': phone.text,
      'batch': enroll_year.value,
    });
    String response = await restAPI.postDataMethod(Constant.REGISTRATION,formData);
   // var data =json.decode(response);
    print("--------------------------"+response);
    isDataLoading.value = false;
    if(response=="true") {
      email.text = "";
      password.text = "";
      firstName.text = "";
      lastName.text = "";
      course.value = "";
      phone.text = "";
      enroll_year.value = "";
      Util.showMessage(context, "New user successfully register.If you are current student need to wait for admin approval.");
      Get.offAllNamed(AppRoutes.LOGIN_ROUTE,);
    }else{
      Util.showMessage(context, "Server issue , please contact admin person.");

    }



  }

}