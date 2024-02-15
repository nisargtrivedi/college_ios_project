import 'dart:convert';

import 'package:embrance/network/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/SqliteService.dart';
import '../../network/RestAPI.dart';
import '../../network/SocketConnection.dart';
import 'model/ChatMessage.dart';
import 'model/alumni_response_entity.dart';

class AlumniChatController extends GetxController{
  final SocketConnection socketConnection = Get.find<SocketConnection>();
  static final chatDB = Get.find<SqliteService>();
  final user = GetStorage();
  var selectedTime = "${DateTime.now().hour}:${DateTime.now().minute}".obs;
  var groupValue = "0".obs;
  TextEditingController chatText = TextEditingController();
  static ScrollController scrollController = ScrollController();


  static List<ChatMessage> messages = <ChatMessage>[].obs;

  late AlumniResponseEntity data;
  static bool isScreenVisible = false;





  @override
  void onInit() {
    // if(socketConnection.socket.disconnected){
    //   socketConnection.socket.connect();
    // }
    // if(socketConnection.socket.connected) {
    //   socketConnection.connect(user.read("userID"));
    // }
    data = Get.arguments as AlumniResponseEntity;
    isScreenVisible= true;
    super.onInit();
    loadOldChat();
  }

  void sendMessage(String receiverID){
    messages.insert(0,ChatMessage(receiver:receiverID,sender:user.read("userID"),messageContent: chatText.text, messageType: "sender",timeChat: DateTime.now()));
    socketConnection.sendMessage(message: chatText.text,receiverID: receiverID,senderID: user.read("userID"));
    chatDB.addNew(ChatMessage(receiver:receiverID,sender:user.read("userID"),messageContent: chatText.text, messageType: "sender",timeChat: DateTime.now()));
    chatText.clear();
    AlumniChatController.scrollController.jumpTo(0);
  }


  void loadOldChat(){
    messages.clear();
    var currentUserID = user.read("userID").toString();
    var otherUser = data.aluId;
    chatDB.getItems(currentUserID,otherUser).obs.value.then((value) => messages.addAll(value));

  }
  @override
  void onClose() {
    isScreenVisible= false;
    super.onClose();
  }
}