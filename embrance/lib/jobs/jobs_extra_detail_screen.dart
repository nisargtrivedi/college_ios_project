import 'dart:convert';

import 'package:embrance/jobs/job_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'jobs_controller.dart';
import 'jobs_detail_controller.dart';

class JobExtraDetailView extends GetView<JobsDetailController>{

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=> JobsDetailController());
   var data = Get.arguments as JobDetailsEntity;

    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff25503f),
        elevation: 10.0,
        //toolbarHeight: 100,
        surfaceTintColor: const Color(0xff25503f),
        title: Text("Job Discovery",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xff25503f),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green,
                            child: Image.asset(
                              height: 20,
                              width: 20,
                              "assets/images/job.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(data.jobTitle.replaceAll("+"," "),style: TextStyle(fontSize: 28,color: Colors.white,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                      color: const Color(0xff25503f),
                      child: Text("\$${data.salaryMin} - \$${data.salaryMax}",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                  Container(
                    height: 50,
                    width: width,
                    alignment: Alignment.centerLeft,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0,),
                      child: Text("JOB TYPE",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),

                  ),
                  Container(padding: const EdgeInsets.only(left:10.0,top: 10,bottom: 10),alignment: Alignment.centerLeft,child: Text("${data.jobType.replaceAll("+", " ")}",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),
                  Container(
                    height: 50,
                    width: width,
                    alignment: Alignment.centerLeft,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0,),
                      child: Text("COMPANY",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(padding: const EdgeInsets.only(left:10.0,top: 10,bottom: 10),alignment: Alignment.centerLeft,child: Text("${data.company.replaceAll("+", " ")}",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),

                  Container(
                    height: 50,
                    width: width,
                    alignment: Alignment.centerLeft,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0,),
                      child: Text("LOCATION",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(padding: const EdgeInsets.only(left:10.0,top: 10,bottom: 10),alignment: Alignment.centerLeft,child: Text("${data.location.replaceAll("+", " ")}",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),
                  Container(
                    height: 50,
                    width: width,
                    alignment: Alignment.centerLeft,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0,),
                      child: Text("NO OF VACANCY",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(padding: const EdgeInsets.only(left:10.0,top: 10,bottom: 10),alignment: Alignment.centerLeft,child: Text("${data.noOfVacancy.replaceAll("+", " ")}",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),

                  Container(
                    height: 50,
                    width: width,
                    alignment: Alignment.centerLeft,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0,),
                      child: Text("SKILLS",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(padding: const EdgeInsets.only(left:10.0,top: 10,bottom: 10),alignment: Alignment.centerLeft,child: Text("${data.skills.replaceAll("+", " ")}",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),

                  Container(
                    height: 50,
                    width: width,
                    alignment: Alignment.centerLeft,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0,),
                      child: Text("JOB DESCRIPTION",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),

                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: HtmlWidget(Uri.decodeComponent(HtmlUnescape().convert(data.description)).replaceAll("+"," "),textStyle: TextStyle(fontSize: 15)),
                  )
                ],
              )

            )
          ],
        ),
      ),
    );


  }
  BoxDecoration decoration(Color color) => BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(20.0),
      topLeft: Radius.circular(50.0),
      bottomRight: Radius.circular(50.0),
    ),
  );
}