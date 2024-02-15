
import 'package:embrance/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/pageroute.dart';
import '../network/constants.dart';

class ProfileView extends StatelessWidget{

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

    return GetBuilder<ProfileController>(init: Get.put<ProfileController>(ProfileController()),builder: (controller){
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.green,toolbarHeight: 0),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:Obx(
            ()=> Container(
              child:  controller.isDataLoading.value ? CircularProgressIndicator() : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    width:width,
                    color: Colors.green,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text("Profile",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18)),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 1,
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(alignment:Alignment.center,child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(width:100,height:100,child: CircleAvatar(backgroundImage: NetworkImage(Constant.IMAGE_URL+controller.useProfile.obs.value[0].avatar,),)),
                            )),
                            SizedBox(height: 20,),
                            commonData("Full Name",controller.useProfile[0].firstname+" "+controller.useProfile.obs.value[0].lastname),
                            SizedBox(height: 10,),
                            commonData("Email",controller.useProfile.obs.value[0].email),
                            SizedBox(height: 10,),
                            commonData("Phone",controller.useProfile.obs.value[0].phone),
                            SizedBox(height: 10,),
                            commonData("Batch",controller.useProfile.obs.value[0].batch),
                            SizedBox(height: 10,),
                            commonData("Course",controller.useProfile.obs.value[0].course,),
                            SizedBox(height: 10,),
                            commonData("Company",controller.useProfile.obs.value[0].connectedTo.isEmpty?"Details not found":controller.useProfile.obs.value[0].connectedTo,),
                            SizedBox(height: 10,),
                            commonData("Skills",controller.useProfile.obs.value[0].skills,),

                          ],
                        ),
                      ),
                    ),
                  ),
                  (controller.userType()=="3")? Padding(
                    padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                    child: MaterialButton(onPressed: (){
                      Get.back();
                    },child: const Text("Back",style: TextStyle(fontSize: 15),),elevation: 10,color: Colors.green,textColor: Colors.white,height: 50,minWidth: width,),
                  ):Container(),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: MaterialButton(onPressed: (){
                      controller.removeData();
                    },child: const Text("Logout",style: TextStyle(fontSize: 15),),elevation: 10,color: Colors.green,textColor: Colors.white,height: 50,minWidth: width,),
                  ),
                ],

              ),
            ),
          ),


        ),

      );
    });




  }

  commonData(String key , String value){
    return Padding(
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      child: Row(
       children: [
          Text(key,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,),
              textAlign: TextAlign.start),
          SizedBox(width: 10,),
          Expanded(child: Text(value,style: TextStyle(color: Colors.black,),textAlign: TextAlign.start,softWrap: false,
            maxLines: 5,overflow: TextOverflow.ellipsis,)),
        ],
      ),
    );
  }

}