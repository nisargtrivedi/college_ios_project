

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_controller.dart';

class NotificationView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => NotificationController());
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
        appBar: AppBar(title: Text("Notification",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green),
        body: Obx(
              ()=> SingleChildScrollView(
            child: NotificationController.meetingList.obs.value.isEmpty?Center(child: Image(image: AssetImage("assets/images/no_notification_image.png",),fit: BoxFit.fill),
            ):ListView.builder(
              reverse: true,
              controller: NotificationController.scrollController,
              scrollDirection: Axis.vertical,
              itemCount: NotificationController.meetingList.obs.value.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
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
                          Text("You have an Invitation for the meeting on ${NotificationController.meetingList[index].meetingDate} at ${NotificationController.meetingList[index].meetingTime} from ${NotificationController.meetingList[index].senderName}.",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
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

}