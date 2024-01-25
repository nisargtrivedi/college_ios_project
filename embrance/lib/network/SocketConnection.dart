import 'dart:convert';
import 'package:embrance/home/alumni_connect/alumni_controller.dart';
import 'package:embrance/home/alumni_connect/model/MeetingModel.dart';
import 'package:embrance/home/alumni_connect/model/message_chat_entity.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../home/alumni_connect/alumni_chat_controller.dart';
import '../home/alumni_connect/model/ChatMessage.dart';
import '../notifications/notification_controller.dart';


class SocketConnection{
  IO.Socket socket = IO.io("http://192.168.0.163:8080/",<String, dynamic>{
    'transports':['websocket'],
    'autoConnect': true,
  });

  void connect(String userID){
    print('connect---------${socket.connected}');
    if(socket.connected) {
      socket.emit('join', userID);
    }
    socket.on('receive_message', (data) {
      MessageChatEntity obj = MessageChatEntity.fromJson(data);
      AlumniChatController.messages.insert(0,ChatMessage(
            receiver: obj.receiverChatID.toString(),
            sender: obj.senderChatID.toString(),
            messageContent: obj.content,
            messageType: "receiver",timeChat: DateTime.now()));
        //AlumniController.scrollController.jumpTo(AlumniController.scrollController.position.maxScrollExtent+10);
      AlumniChatController.chatDB.addNew(ChatMessage(
          receiver: obj.receiverChatID.toString(),
          sender: obj.senderChatID.toString(),
          messageContent: obj.content,
          messageType: "receiver",timeChat: DateTime.now()));

      if(AlumniChatController.isScreenVisible) AlumniChatController.scrollController.jumpTo(0);
    });

    socket.on('receive_invitation', (data) {
      print(data.toString());
      MeetingModel obj = MeetingModel.fromMap(data);
      NotificationController.chatDB.addNewInvitation(obj);
      if(NotificationController.isScreenVisible) {
        NotificationController.meetingList.insert(0,obj);
      }
    });
  }
  void leaveSocket(String userID){
    socket.emit('leaveUser', userID);
  }
  void sendMessage({message,senderID,receiverID}){
    var data = {
      "message":{
        'receiverChatID':receiverID,"senderChatID":senderID,'content':message
      }
    };
    if(!socket.connected){
      socket.connect();
      Future.delayed(2000.seconds,(){
        connect(senderID);
      });
    }
    socket.emit('send_message', jsonEncode(data));
  }

  void sendMeetingNotes({message,senderID,receiverID,selectDate,selectTime,mode,senderName}){
    var data = {
      "message":{
        'receiverChatID':receiverID,"senderChatID":senderID,'content':message,'meeting_mode':mode,'date':selectDate,'time':selectTime,'senderName':senderName
      }
    };
    if(!socket.connected){
      socket.connect();
      Future.delayed(2000.seconds,(){
        connect(senderID);
      });
    }
    socket.emit('send_invitation', jsonEncode(data));
  }

  void disconnect(){
    socket.disconnect();
  }


}