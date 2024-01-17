import 'package:embrance/generated/json/base/json_convert_content.dart';
import 'package:embrance/home/alumni_connect/model/message_chat_entity.dart';

MessageChatEntity $MessageChatEntityFromJson(Map<String, dynamic> json) {
  final MessageChatEntity messageChatEntity = MessageChatEntity();
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    messageChatEntity.content = content;
  }
  final int? senderChatID = jsonConvert.convert<int>(json['senderChatID']);
  if (senderChatID != null) {
    messageChatEntity.senderChatID = senderChatID;
  }
  final int? receiverChatID = jsonConvert.convert<int>(json['receiverChatID']);
  if (receiverChatID != null) {
    messageChatEntity.receiverChatID = receiverChatID;
  }
  return messageChatEntity;
}

Map<String, dynamic> $MessageChatEntityToJson(MessageChatEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['content'] = entity.content;
  data['senderChatID'] = entity.senderChatID;
  data['receiverChatID'] = entity.receiverChatID;
  return data;
}

extension MessageChatEntityExtension on MessageChatEntity {
  MessageChatEntity copyWith({
    String? content,
    int? senderChatID,
    int? receiverChatID,
  }) {
    return MessageChatEntity()
      ..content = content ?? this.content
      ..senderChatID = senderChatID ?? this.senderChatID
      ..receiverChatID = receiverChatID ?? this.receiverChatID;
  }
}