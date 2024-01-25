import 'dart:convert';
import 'package:embrance/network/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../network/RestAPI.dart';
import 'job_details_entity.dart';
import 'jobs_entity.dart';



class JobsController extends GetxController{

  ScrollController scrollController = ScrollController();

  final RestAPI restAPI = Get.find<RestAPI>();
  List<JobsEntity> jobs = <JobsEntity>[].obs;
  List<JobDetailsEntity> jobsDetails = <JobDetailsEntity>[].obs;
  var isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadJobs();
  }

  void loadJobs() async {
      var header = { "Content-Type": "application/json;"};
      isDataLoading.value = true;
      String response = await restAPI.getDataMethod(Constant.JOBS_CATEGORY, header);
      print("JOBS RESPONSE IS"+response.toString());
        var data = jsonDecode(response);
      jobs = data.map<JobsEntity>((json) => JobsEntity.fromJson(json)).toList();
      isDataLoading.value = false;
  }

  void loadJobsByName(String name) async {
    var header = { "Content-Type": "application/json;"};
    String response = await restAPI.getDataMethodWithQotes("${Constant.JOBS_DETAILS_CATEGORY}&category=${name}", header);
    print("JOBSSSSS RESPONSE IS"+response.toString());
    var data = jsonDecode(response);
    jobsDetails = data.map<JobDetailsEntity>((json) => JobDetailsEntity.fromJson(json)).toList();
    isDataLoading.value = false;
  }


  @override
  void onReady() {
    checkArguments();
    super.onReady();
  }

  void checkArguments(){
      if(Get.arguments!=null) {
        Future.delayed(20000.milliseconds);
         isDataLoading.value = true;
         if (Get.arguments is String) {
          var name = Get.arguments;
          loadJobsByName(name);
        }
      }
  }
  @override
  void onClose() {
    super.onClose();
  }



}