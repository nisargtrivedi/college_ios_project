import 'dart:convert';
import 'dart:ffi';

import 'package:embrance/network/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

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
  List<ChatMessage> chatUsers=[];
  var selectedTime = "${DateTime.now().hour}:${DateTime.now().minute}".obs;
  static final chatDB = Get.find<SqliteService>();

  var groupValue = "0".obs;
  var selectedDate = (DateFormat('EEEE').format(DateTime.now())=="Thursday" || DateFormat('EEEE').format(DateTime.now())=="Friday")? "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}".obs : "".obs;

  final RestAPI restAPI = Get.find<RestAPI>();
  TextEditingController searchText = TextEditingController();
  TextEditingController msgController = TextEditingController();
  int pageName=0;
  late AlumniResponseEntity data;

  static var isScreenVisible=false.obs;





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

    // if(userType()=="1") getApi();
    // if(userType()=="2") loadOldChat();
    loadOldChat();
    isScreenVisible.value = true;

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
    String response = await restAPI.getDataMethod(pageName==2?Constant.GET_ALL_ALUMNI+"&current_user=${user.read("userID")}" :(userType()=="1")?Constant.GET_ALL_SENIOR+"&current_user=${user.read("userID")}":Constant.GET_ALL_JUNIOR+"&current_user=${user.read("userID")}",header);
    var data =json.decode(response);
    list = data.map<AlumniResponseEntity>((json) => AlumniResponseEntity.fromJson(json)).toList();


    searchFunction();
    isDataLoading.value = false;
    print("RESPONSE IS"+response);



  }
    void searchFunction(){
        if (searchText.text.isNotEmpty) {
          filterList.clear();
          list.forEach((element) {

            if((userType()=="3" || userType()=="2") && pageName==1){
              if (element.firstname.toLowerCase().contains(
                  searchText.text.toLowerCase()) ||
                  element.lastname.toLowerCase().contains(
                      searchText.text.toLowerCase())) {
                if(chatUsers.where((element1) => (element1.receiver==element.aluId || element1.sender==element.aluId)).isNotEmpty) {
                  filterList.add(element);
                }
              }
            }else{
              if (element.firstname.toLowerCase().contains(
                  searchText.text.toLowerCase()) ||
                  element.lastname.toLowerCase().contains(
                      searchText.text.toLowerCase())) {
                filterList.add(element);
              }
            }
          });
        }
        else {
          filterList.clear();
          if((userType()=="3" || userType()=="2") && pageName==1){
              if(chatUsers.isNotEmpty){
                list.forEach((element1) {
                  if(chatUsers.where((element) => (element.receiver==element1.aluId || element.sender==element1.aluId)).isNotEmpty) {
                      filterList.add(element1);
                  }
                });
              }
          }else{
            filterList.addAll(list);
          }
        }
  }

    void saveMeeting(String receiverID){
    socketConnection.sendMeetingNotes(message: msgController.text,receiverID: receiverID,senderID: user.read("userID"),mode: groupValue.value,selectDate: selectedDate.value,selectTime: selectedTime.value,senderName: user.read("username"));
    msgController.clear();
  }

  String userType(){
    return user.read("user_type");
  }

  @override
  void onClose() {
    isScreenVisible.value = false;
    super.onClose();
  }

  void loadOldChat(){
    var currentUserID = user.read("userID").toString();
    chatDB.getChatUsers(currentUserID).obs.value.then((value) => chatUsers.addAll(value));
    getApi();
  }
}