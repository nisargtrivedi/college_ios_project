import 'dart:async';
import 'dart:convert';

import 'package:embrance/home/alumni_connect/model/MeetingModel.dart';
import 'package:embrance/notifications/model/EventsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../component/SqliteService.dart';
import '../network/RestAPI.dart';
import '../network/constants.dart';

class NotificationController extends GetxController{

  static final chatDB = Get.find<SqliteService>();
  static ScrollController scrollController = ScrollController();

  static List<MeetingModel> meetingList = <MeetingModel>[].obs;
  List<EventModel> eventList = <EventModel>[].obs;
  final RestAPI restAPI = Get.find<RestAPI>();
  final user = GetStorage();
  static bool isScreenVisible = false;
  var isDataLoading = false.obs;
  @override
  void onInit() {
    isScreenVisible = true;
    super.onInit();
    getAllMeetings();


  }

  void getAllMeetings(){

     getApi();
  }

  void getApi() async {
    var header = { "accept":"application/json"};
    isDataLoading.value = true;
    eventList.clear();
    meetingList.clear();
    String response = await restAPI.getDataMethod(Constant.GET_ALL_EVENTS,header);
    var data = jsonDecode(Uri.decodeComponent(response));
    eventList = data.map<EventModel>((json) => EventModel.fromMap(json)).toList();
    isDataLoading.value = false;
    //print("RESPONSE IS"+response);

    var currentUserID = user.read("userID").toString();
    chatDB.getMeetingItems(currentUserID).obs.value.then((value) => meetingList.addAll(value));


    eventList.obs.value.forEach((element) {
      meetingList.insert(0, MeetingModel(sender: "1", receiver: user.read("userID"), messageContent: element.content, meetingMode: element.title, meetingDate: element.schedule, meetingTime: element.schedule, senderName: "Admin"));
    });
  }

  @override
  void onClose() {
    isScreenVisible = false;
    super.onClose();
  }
}