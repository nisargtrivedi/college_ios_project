import 'dart:convert';


import 'package:embrance/network/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'alumni_chat_controller.dart';
import 'package:timeago/timeago.dart' as timeago;




class AlumniConnectChatScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return GetBuilder<AlumniChatController>(init: Get.put<AlumniChatController>(AlumniChatController()),builder: (controller){
      return Scaffold(
            backgroundColor: Colors.white,
          // appBar: AppBar(backgroundColor: Colors.green,title: Text("${data.firstname} ${data.lastname}",style: TextStyle(color: Colors.white),),leading: IconButton(
          //   icon: const Icon(Icons.arrow_back,color: Colors.white),
          //   onPressed: () => Get.back(),
          // ),),

        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                  SizedBox(width: 2,),
                  CircleAvatar(
                    backgroundImage: NetworkImage(Constant.IMAGE_URL+controller.data.avatar),
                    maxRadius: 20,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${controller.data.firstname} ${controller.data.lastname}",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600,color: Colors.white),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Container(
                    child: Obx(
                      ()=>AlumniChatController.messages.obs.value.length==0?Container(): Container(
                          child: ListView.builder(
                            reverse: true,
                            controller: AlumniChatController.scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount: AlumniChatController.messages.obs.value.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index){
                              return Container(
                                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                                  child: Align(
                                    alignment: (AlumniChatController.messages.obs.value[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: (AlumniChatController.messages.obs.value[index].messageType  == "receiver"?Colors.grey.shade200:Colors.green),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(AlumniChatController.messages.obs.value[index].messageContent,textAlign: TextAlign.start, style: TextStyle(fontSize: 15,color: (AlumniChatController.messages.obs.value[index].messageType  == "receiver"?Colors.black:Colors.white)),),
                                          SizedBox(height: 5,),
                                          Text(timeago.format(AlumniChatController.messages.obs.value[index].timeChat),textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: (AlumniChatController.messages.obs.value[index].messageType  == "receiver"?Colors.black:Colors.white)),),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                            },
                          ),
                        ),
                    ),

                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 15,bottom: 10,top: 10,right: 10),
                    width: double.infinity,
                    color: Colors.grey.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: controller.chatText,
                            minLines: 1,
                            maxLines: 2,
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                              ),focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                            )
                            ),textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 15,),

                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 30,
                          child: IconButton(
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.send),
                            color: Colors.white,
                            onPressed: () {
                              if(controller.chatText.text.isNotEmpty) controller.sendMessage(controller.data.aluId);
                            },
                          ),
                        ),
                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
      );
    });
  }



}
