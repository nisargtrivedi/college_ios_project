import 'dart:convert';
import 'dart:ffi';

import 'package:embrance/network/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/SqliteService.dart';
import '../../network/RestAPI.dart';
import '../../network/SocketConnection.dart';
import 'model/ChatMessage.dart';
import 'model/alumni_response_entity.dart';

class AlumniController extends GetxController{
  final SocketConnection socketConnection = Get.find<SocketConnection>();
  final user = GetStorage();
  var isDataLoading = false.obs;
  List<AlumniResponseEntity> list = <AlumniResponseEntity>[].obs;
  List<AlumniResponseEntity> filterList = <AlumniResponseEntity>[].obs;
  var selectedTime = "${DateTime.now().hour}:${DateTime.now().minute}".obs;
  var groupValue = "0".obs;
  final RestAPI restAPI = Get.find<RestAPI>();
  TextEditingController searchText = TextEditingController();
  int pageName=0;
  late AlumniResponseEntity data;





  @override
  void onInit() {
    if(Get.arguments!=null) {

      if(Get.arguments is int) {
        pageName = Get.arguments as int;
      }
      else if(Get.arguments is AlumniResponseEntity) {
        data = Get.arguments as AlumniResponseEntity;
      }
    }
    getApi();
    super.onInit();
  }
  void loadData(){
    if(Get.arguments!=null) {

      if(Get.arguments is int) {
        pageName = Get.arguments as int;
      }
      else if(Get.arguments is AlumniResponseEntity) {
        data = Get.arguments as AlumniResponseEntity;
      }
    }
  }
    void getApi() async {
    var header = { "accept":"application/json"};
    isDataLoading.value = true;
    String response = await restAPI.getDataMethod(pageName==2?Constant.GET_ALL_ALUMNI+"&current_user=${user.read("userID")}" : Constant.GET_ALL_SENIOR+"&current_user=${user.read("userID")}",header);
    var data =json.decode(response);
    list = data.map<AlumniResponseEntity>((json) => AlumniResponseEntity.fromJson(json)).toList();
    searchFunction();
    isDataLoading.value = false;
    print("RESPONSE IS"+response);
  }
  void searchFunction(){
    if(searchText.text.isNotEmpty) {
      filterList.clear();
      list.forEach((element) {
        if (element.firstname.toLowerCase().contains(searchText.text.toLowerCase()) ||
            element.lastname.toLowerCase().contains(searchText.text.toLowerCase())) {
          filterList.add(element);
        }
      });
    }else{
        filterList.clear();
        filterList.addAll(list);
    }
  }

}