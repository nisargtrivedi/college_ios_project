

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_controller.dart';

class NotificationView extends GetView<NotificationController>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Notification"),),
      body: Center(child: Image(image: AssetImage("assets/images/no_notification_image.png",),fit: BoxFit.fill),),
    );
  }

}