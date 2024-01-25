import 'package:embrance/home/alumni_connect/model/MeetingModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../component/SqliteService.dart';

class NotificationController extends GetxController{

  static final chatDB = Get.find<SqliteService>();
  static ScrollController scrollController = ScrollController();

  static List<MeetingModel> meetingList = <MeetingModel>[].obs;

  final user = GetStorage();
  static bool isScreenVisible = false;

  @override
  void onInit() {
    isScreenVisible = true;
    getAllMeetings();
    super.onInit();
  }

  void getAllMeetings(){
    meetingList.clear();
     var currentUserID = user.read("userID").toString();
     chatDB.getMeetingItems(currentUserID).obs.value.then((value) => meetingList.addAll(value));
  }

  @override
  void onClose() {
    isScreenVisible = false;
    super.onClose();
  }
}