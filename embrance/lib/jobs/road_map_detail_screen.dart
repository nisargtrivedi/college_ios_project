
import 'package:embrance/jobs/roadmap_controller.dart';
import 'package:embrance/network/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Courses.dart';
import 'job_details_entity.dart';

class RoadMapDetailView extends GetView<RoadMapController>{

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> RoadMapController());
    var data = Get.arguments as Courses;
    //var year = Get.arguments[1];

    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;


    // return WebviewScaffold(
    //   url: "${Constant.COURSE_DETAIL_URL}${data.jobCategory}&year=${year}&jobid=${data.id}",
    //   appBar: new AppBar(
    //     backgroundColor: Colors.green,
    //     title: new Text("Offered Course",style: TextStyle(color: Colors.white),),
    //     leading: IconButton(
    //       icon: const Icon(Icons.arrow_back,color: Colors.white),
    //       onPressed: () => Get.back(),
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 10.0,
        //toolbarHeight: 100,
        surfaceTintColor: Colors.green,
        title: Text("${data.no}",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body:  Container(
        height: height,
        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 10),
        child: Container(child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(alignment: Alignment.centerLeft,child: Row(
                  children: [
                    Text("Prerequisite(s):",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Expanded(child: Text("${data.prerequisite}",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(alignment: Alignment.centerLeft,child: Row(
                  children: [
                    Text("Term Offered:",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("${data.semester}",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(alignment: Alignment.centerLeft,child: Row(
                  children: [
                    Text("Advisable year:",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("${adviceYear(data.no)}",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(alignment: Alignment.centerLeft,child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Details:",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("${data.skills}",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
                  ],
                )),
              ),
            ],
          ),
        ),),
      ),
    );

  }

  String adviceYear(String no){
    String year="";
    if(no.startsWith("CSC")){
      no = no.replaceAll("CSC ", "");
      if(int.parse(no)>=1 && int.parse(no)<=20){
        year="First";
      }
      else if(int.parse(no)>=21 && int.parse(no)<=100){
        year="Second";
      }
      else if(int.parse(no)>=101 && int.parse(no)<=200){
        year="Third";
      }else{
        year="Fourth";
      }
    }
    else if(no.startsWith("CPE")){
      no = no.replaceAll("CPE ", "");
      if(int.parse(no)>=1 && int.parse(no)<=20){
        year="First";
      }
      else if(int.parse(no)>=21 && int.parse(no)<=100){
        year="Second";
      }
      else if(int.parse(no)>=101 && int.parse(no)<=200){
        year="Third";
      }else{
        year="Fourth";
      }
    }else if(no.startsWith("CE")){
      no = no.replaceAll("CE ", "");
      if(int.parse(no)>=1 && int.parse(no)<=10){
        year="First";
      }
      else if(int.parse(no)>=100 && int.parse(no)<=140){
        year="Second";
      }
      else if(int.parse(no)>=140 && int.parse(no)<=160){
        year="Third";
      }else{
        year="Fourth";
      }
    }else if(no.startsWith("ME")){
      no = no.replaceAll("ME ", "");
      if(int.parse(no)>=37 && int.parse(no)<=76){
        year="First";
      }
      else if(int.parse(no)>=100 && int.parse(no)<=120){
        year="Second";
      }
      else if(int.parse(no)>=121 && int.parse(no)<=150){
        year="Third";
      }else{
        year="Fourth";
      }
    }else if(no.startsWith("EEE")){
      no = no.replaceAll("EEE ", "");
      if(int.parse(no)>=64 && int.parse(no)<=99){
        year="First";
      }
      else if(int.parse(no)>=100 && int.parse(no)<=130){
        year="Second";
      }
      else if(int.parse(no)>=131 && int.parse(no)<=160){
        year="Third";
      }else{
        year="Fourth";
      }
    }

    return year;
  }

}