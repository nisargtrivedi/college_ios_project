import 'dart:convert';

import 'package:embrance/jobs/job_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import '../component/pageroute.dart';
import 'jobs_controller.dart';
import 'jobs_detail_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

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
        backgroundColor: Colors.green,
        elevation: 10.0,
        //toolbarHeight: 100,
        surfaceTintColor: Colors.green,
        title: Text("Job Detail",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () => Get.back(),
        ),actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE,arguments:[data,data.jobCategory]);
            },
            child: Image.asset(
              height: 30,
              width: 30,
              "assets/images/distance.png",
              color: Colors.white,
            ),
          ),
        )
      ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                surfaceTintColor: Colors.grey,
                elevation: 10,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0,bottom: 30,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(data.jobTitle,textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Text("${data.company}",textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey.shade900),)),
                          SizedBox(width: 10,),
                          Expanded(child:  Text("${data.location}",textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey.shade900),),),
                          SizedBox(width: 10,),
                          Expanded(child:  Text("${timeago.format(DateTime.parse(data.dateCreated))}",textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey.shade900),),),
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("Salary",textAlign: TextAlign.start,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                       Text("\$${data.salaryMin} - \$${data.salaryMax}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),)
                     ],
                   ),
                 ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Job Type",textAlign: TextAlign.start,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                        Text("${data.jobType}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Vacancy",textAlign: TextAlign.start,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                        Text("${data.noOfVacancy}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: width,
              alignment: Alignment.centerLeft,
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.only(left:10.0,),
                child: Text("Skills",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 16)),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20),
              child: HtmlWidget(HtmlUnescape().convert("${data.skills}")),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              width: width,
              alignment: Alignment.centerLeft,
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.only(left:10.0,),
                child: Text("Job Description",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 16)),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20),
              child: HtmlWidget(HtmlUnescape().convert("${data.description}")),
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