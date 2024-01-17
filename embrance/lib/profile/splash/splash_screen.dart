import 'package:embrance/profile/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return GetBuilder<SplashController>(
        init: Get.put<SplashController>(SplashController()),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xff25503f),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: Container(
                  child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: 150,
                            height: 150,
                          )),
                ),),
            ),
          );
        });
  }
}
