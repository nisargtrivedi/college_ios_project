

import 'package:embrance/home/alumni_connect/model/MeetingModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

import 'notification_controller.dart';

class NotificationView extends GetView<NotificationController>{

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return  GetBuilder<NotificationController>(
        init: Get.put<NotificationController>(NotificationController()),
        builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Notification",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: ()=>controller.getApi(),child: Icon(Icons.refresh,color: Colors.white,)),
          )
        ],),
        body: Obx(
              ()=> SingleChildScrollView(
            child: NotificationController.meetingList.obs.value.isEmpty?Center(child: Image(image: AssetImage("assets/images/no_notification_image.png",),fit: BoxFit.fill),
            ):ListView.builder(
              reverse: false,
              controller: NotificationController.scrollController,
              scrollDirection: Axis.vertical,
              itemCount: NotificationController.meetingList.obs.value.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return InkWell(
                  onTap: ()=>NotificationController.meetingList.obs.value[index].senderName!="Admin"? showDialogs(context,NotificationController.meetingList.obs.value[index],width):showDialogsAdmin(context,NotificationController.meetingList.obs.value[index],width),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: width,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      surfaceTintColor: Colors.white,
                      elevation: 3,
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (NotificationController.meetingList[index].senderName!="Admin")? Text("You have an Invitation for the meeting on ${NotificationController.meetingList[index].meetingDate} at ${NotificationController.meetingList[index].meetingTime} from ${NotificationController.meetingList[index].senderName}.",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),):
                                Text("You received the message from Admin related to ${NotificationController.meetingList[index].meetingMode.replaceAll("+", " ")} on ${NotificationController.meetingList[index].meetingDate.replaceAll("+", " ")}",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });


  }
  void showDialogs(BuildContext context,MeetingModel model,double width){
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.white,
        elevation: 10,
        insetPadding: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        title: Text('Meeting Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
        content: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Meeting Person Name ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
              Text(model.senderName,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14,),),
              SizedBox(height: 10,),
              Text("Date ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
              Text(model.meetingDate,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14),),
              SizedBox(height: 10,),
              Text("Time ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
              Text(model.meetingTime,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14),),
              SizedBox(height: 10,),
              Text("Details ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
              Text(model.messageContent,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14),),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
        ],
      ),
    );
  }

  void showDialogsAdmin(BuildContext context,MeetingModel model,double width){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.white,
        elevation: 10,
        insetPadding: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        title: Text('Event Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
        content: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Event Title ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                Text(model.meetingMode.replaceAll("+", " "),style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14,),),
                SizedBox(height: 10,),
                Text("Date ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                Text(model.meetingDate.replaceAll("+", " "),style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14),),
                SizedBox(height: 10,),
                Text("Details ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                //Text(model.messageContent,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14),),
                HtmlWidget(HtmlUnescape().convert(model.messageContent.replaceAll(("+"), " ")),textStyle: TextStyle(fontSize: 14),),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
        ],
      ),
    );
  }
}