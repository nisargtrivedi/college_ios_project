
class MeetingModel{

  String sender;
  String receiver;
  String messageContent;
  String meetingMode;
  String meetingDate;
  String meetingTime;
  String senderName;
  MeetingModel({required this.sender,required this.receiver,required this.messageContent,  required this.meetingMode,required this.meetingDate,required this.meetingTime,required this.senderName});

  MeetingModel.fromMap(Map<String, dynamic> item):
        sender=item["sender"], receiver= item["receiver"],messageContent= item["messageContent"],meetingMode= item["meetingMode"],meetingDate= item["dateMeetings"],meetingTime=item["timeMeetings"],senderName=item["senderName"];


  Map<String, Object> toMap(){
    return {'sender':sender,'receiver': receiver,'messageContent': messageContent,'meetingMode': meetingMode,'dateMeetings': meetingDate.toString(),'timeMeetings': meetingTime.toString(),'senderName':senderName};
  }
}