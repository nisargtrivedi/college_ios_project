import 'dart:math';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:embrance/component/pageroute.dart';
import 'package:embrance/home/alumni_connect/model/alumni_response_entity.dart';
import 'package:embrance/network/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alumni_controller.dart';



class AlumniConnectDetailView extends StatelessWidget {
  AlumniResponseEntity data = Get.arguments as AlumniResponseEntity;

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

    return GetBuilder<AlumniController>(init: Get.put<AlumniController>(AlumniController()),builder: (controller){


      return Scaffold(
            backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.green,title: Text("${data.firstname} ${data.lastname}",style: TextStyle(color: Colors.white),),leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white),
            onPressed: () => Get.back(),
          ),),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                            child: Container(width:100,height:100,child: CircleAvatar(backgroundImage: NetworkImage(Constant.IMAGE_URL+data.avatar,),)),
                          )),
                          SizedBox(height: 20,),
                          commonData("Email",data.email),
                          SizedBox(height: 10,),
                          commonData("Phone",data.phone),
                          SizedBox(height: 10,),
                          commonData("Batch",data.batch),
                          SizedBox(height: 10,),
                          commonData("Course",data.course),
                          SizedBox(height: 10,),
                          commonData("Company",data.connectedTo.isEmpty?"Details not found":data.connectedTo),
                          SizedBox(height: 10,),
                          commonData("Skills",data.skills),

                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                  child: MaterialButton(onPressed: (){
                    Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE+AppRoutes.ALUMNI_CONNECT_SCHEDULE_ROUTE,arguments: data);
                  },child: const Text("Connect",style: TextStyle(fontSize: 15),),elevation: 10,color: Colors.green,textColor: Colors.white,height: 50,minWidth: width,),
                ),
              ],

            ),
          )
      );
    });
  }


  commonData(String key , String value){
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(key,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,),textAlign: TextAlign.start),
          SizedBox(width: 10,),
          Expanded(child: Text(value,style: TextStyle(color: Colors.black,),textAlign: TextAlign.start,softWrap: false,
          maxLines: 10,overflow: TextOverflow.ellipsis,)),
        ],
      ),
    );
  }


}
