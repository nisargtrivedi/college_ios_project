

import 'package:embrance/scholarship/scholarship_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';


class ScholarshipView extends GetView<ScholarShipController>{


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> ScholarShipController());
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 10.0,
        //toolbarHeight: 100,
        surfaceTintColor: const Color(0xff25503f),
        title: Text("Scholarships",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body:Container(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        height:height,
        child: Obx(
              ()=> controller.isDataLoading.value ? CircularProgressIndicator():
          ListView.builder(
            reverse: false,
            controller: controller.scrollController,
            scrollDirection: Axis.vertical,
            itemCount: controller.list.length,
            shrinkWrap: true,
            addRepaintBoundaries: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                width: width,
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: InkWell(
                  onTap: ()=>controller.launchURL(controller.list[index].scLink),
                  //onTap: ()=> Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_ROUTE,arguments:controller.jobs[index].jobCategory ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    surfaceTintColor: Colors.white,
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(controller.list[index].title.replaceAll(("+"), " "),textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Amount : ${controller.list[index].award.replaceAll(("+"), " ")}",textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Deadline : ${controller.list[index].deadline.replaceAll(("+"), " ")}",textAlign: TextAlign.left,maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black54),),
                        ),
                        ExpansionTile(
                            tilePadding: const EdgeInsets.all(0),
                            childrenPadding: const EdgeInsets.only(left: 8,right: 8),
                            title: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("Description",textAlign: TextAlign.left,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black54)
                        ),
                              ),
                            ),
                            children: [
                               HtmlWidget(HtmlUnescape().convert(controller.list[index].description.replaceAll(("+"), " ")),textStyle: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
      )
    );
  }

}