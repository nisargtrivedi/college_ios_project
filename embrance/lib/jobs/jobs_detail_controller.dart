import 'dart:convert';
import 'package:embrance/network/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../network/RestAPI.dart';
import 'job_details_entity.dart';
import 'jobs_entity.dart';



class JobsDetailController extends GetxController{

  ScrollController scrollController = ScrollController();

  final RestAPI restAPI = Get.find<RestAPI>();
  List<JobDetailsEntity> jobsDetails = <JobDetailsEntity>[].obs;
  var isDataLoading = false.obs;
  var name = "".obs;

  @override
  void onInit() {
    super.onInit();
    checkArguments();
  }


  void loadJobsByName(String name) async {
    var header = { "Content-Type": "application/json;"};
    String response = await restAPI.getDataMethodWithQotes("${Constant.JOBS_DETAILS_CATEGORY}&category=${name}", header);
    print("JOBSSSSS RESPONSE IS"+Uri.decodeComponent(response.toString()));
    var data = jsonDecode(Uri.decodeComponent(response));
    jobsDetails = data.map<JobDetailsEntity>((json) => JobDetailsEntity.fromJson(json)).toList();
    isDataLoading.value = false;
  }

  void checkArguments(){
      if(Get.arguments!=null) {
         isDataLoading.value = true;
         if (Get.arguments is String) {
          name.value = Get.arguments;
          loadJobsByName(name.value);
        }
      }
  }
  @override
  void onClose() {
    super.onClose();
  }



}