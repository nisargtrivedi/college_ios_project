import 'package:embrance/component/pageroute.dart';
import 'package:embrance/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/util.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<ProfileController>(
        init: Get.put<ProfileController>(ProfileController()),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xff25503f),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: 150,
                            height: 150,
                          )),
                      const Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.email,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                     Obx(
                       ()=> controller.isVerfied.value?Container(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: controller.password,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "New Password",
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 0.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: controller.re_password,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Re-Type New Password",
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 0.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ):Container(),
                     ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: width,
                        height: 50,
                        child: Obx(
                          () => controller.isDataLoading.value
                              ? SizedBox(width:50,height:50,child: const CircularProgressIndicator())
                              : MaterialButton(
                                  onPressed: () {
                                      if (controller.email.text.isEmpty && controller.isVerfied.value==false){
                                        Util.showMessage(context,"Please enter email");
                                      }else if (controller.password.text.isEmpty && controller.isVerfied.value==true){
                                        Util.showMessage(context,"Please enter new password");
                                      }else if (controller.re_password.text.isEmpty && controller.isVerfied.value==true){
                                        Util.showMessage(context,"Please enter re-type new password");
                                      }else if (controller.re_password.text != controller.password.text){
                                        Util.showMessage(context,"New password and re-type new password text should be match");
                                      }else
                                        controller.forgotPasswordAPI(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Reset Password",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                  color: Colors.green,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
