
class ChatMessage{

  String sender;
  String receiver;
  String messageContent;
  String messageType;
  DateTime timeChat;
  ChatMessage({required this.sender,required this.receiver,required this.messageContent,  required this.messageType,required this.timeChat});

  ChatMessage.fromMap(Map<String, dynamic> item):
        sender=item["sender"], receiver= item["receiver"],messageContent= item["messageContent"],messageType= item["messageType"],timeChat= DateTime.parse(item["timeChat"]);

  Map<String, Object> toMap(){
    return {'sender':sender,'receiver': receiver,'messageContent': messageContent,'messageType': messageType,'timeChat': timeChat.toString()};
  }
}