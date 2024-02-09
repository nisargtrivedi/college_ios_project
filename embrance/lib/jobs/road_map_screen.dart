
import 'package:embrance/jobs/roadmap_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component/pageroute.dart';
import 'job_details_entity.dart';

class RoadMapView extends GetView<RoadMapController>{

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> RoadMapController());
    var data = Get.arguments[0] as JobDetailsEntity;


    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    // return GetBuilder<JobsController>(init: Get.put<JobsController>(JobsController()),builder: (controller){
    //
    // });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 10.0,
        //toolbarHeight: 100,
        surfaceTintColor: Colors.green,
        title: Text("Road Map",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body:  Container(
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        child: Container(
          height: height,
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: 100,
                child: InkWell(
                  onTap: (){
                    String urlCourse = "";
                    if(data.jobCategory=="Computer Science"){
                      urlCourse = "https://catalog.csus.edu/colleges/engineering-computer-science/computer-science/#coursestext";
                    }else if(data.jobCategory=="Civil Engineering"){
                      urlCourse = "https://catalog.csus.edu/colleges/engineering-computer-science/engineering-civil/#coursestext";
                    }else if(data.jobCategory=="Mechanical Engineering"){
                      urlCourse = "https://catalog.csus.edu/courses-a-z/me/";
                    }else if(data.jobCategory=="Electrical Engineering"){
                      urlCourse = "https://catalog.csus.edu/courses-a-z/eee/";
                    }else if(data.jobCategory=="Computer Engineering"){
                      urlCourse = "https://catalog.csus.edu/courses-a-z/cpe/";
                    }
                    final Uri url = Uri.parse(urlCourse);
                    launchUrl(url);
                  },
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    surfaceTintColor: Colors.grey,
                    child: Container(alignment: Alignment.center,child: Text(data.jobCategory,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
              (data.jobCategory=="Computer Science" || data.jobCategory=="Computer Engineering")?ce_and_cs():(data.jobCategory=="Electrical Engineering")?ec():(data.jobCategory=="Mechanical Engineering")?me():civil()

            ],
          ),
        ),
      ),
    );

  }

  ce_and_cs(){
    return Expanded(
      flex: 1,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("UI/UX,H/W,Embedded Systems OR GRAPHICS DESIGN",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listOne.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listOne[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listOne[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("MOBILE AND WEB PROGRAMMING",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listTwo.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listTwo[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listTwo[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("DATABASE",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listThree.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listThree[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listThree[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("NETWORKING",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listFive.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listFive[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listFive[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("ANIMATION",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listFour.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listFour[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listFour[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        )
      ],),
    );
  }
  civil(){
    return Expanded(
      flex: 1,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Geotechnical Modeling",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listOne.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listOne[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listOne[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Graphics and CAD",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listTwo.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listTwo[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listTwo[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Transportation",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listThree.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listThree[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listThree[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Structural",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listFive.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listFive[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listFive[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Environmental",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listFour.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listFour[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listFour[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        )
      ],),
    );
  }

  ec(){
    return Expanded(
      flex: 1,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Logical & Circuit Design",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listOne.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listOne[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listOne[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Communication",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listTwo.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listTwo[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listTwo[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Robotics & Machine Learning",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listThree.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listThree[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listThree[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),

      ],),
    );
  }

  me(){
    return Expanded(
      flex: 1,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Energy and Quality Analyst",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listOne.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listOne[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listOne[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Aerospace & Vehicle-Machine Design",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listTwo.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listTwo[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listTwo[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("CAD Technician",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listThree.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listThree[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listThree[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Maintenance",textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
        ),
        Container(
          height: 150,
          alignment: Alignment.center,
          child: Obx(
                ()=>
                ListView.builder(
                  reverse: false,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listFour.length,
                  shrinkWrap: true,
                  addRepaintBoundaries: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE+AppRoutes.ROADMAP_ROUTE+AppRoutes.ROADMAP_ROUTE_DETAIL,arguments:controller.listFour[index]);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(5),
                        child: Card(
                            surfaceTintColor: Colors.grey,
                            elevation: 10,
                            shadowColor: Colors.grey,
                            child: Container(alignment: Alignment.center,child: Text(controller.listFour[index].no,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                        ),
                      ),
                    );
                  },
                ),
          ),
        )
      ],),
    );
  }

}