import 'package:embrance/generated/json/base/json_field.dart';
import 'package:embrance/generated/json/message_chat_entity.g.dart';
import 'dart:convert';
export 'package:embrance/generated/json/message_chat_entity.g.dart';

@JsonSerializable()
class MessageChatEntity {
	late String content;
	late int senderChatID;
	late int receiverChatID;

	MessageChatEntity();

	factory MessageChatEntity.fromJson(Map<String, dynamic> json) => $MessageChatEntityFromJson(json);

	Map<String, dynamic> toJson() => $MessageChatEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}