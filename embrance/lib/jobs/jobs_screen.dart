
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/pageroute.dart';
import 'jobs_controller.dart';

class JobsView extends GetView<JobsController>{

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=> JobsController());

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
        title: Text("Job Discovery",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body:  Container(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        child: Obx(
              ()=> controller.isDataLoading.value ? CircularProgressIndicator():
          ListView.builder(
            reverse: false,
            controller: controller.scrollController,
            scrollDirection: Axis.vertical,
            itemCount: controller.jobs.length,
            shrinkWrap: true,
            addRepaintBoundaries: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  //Get.toNamed(AppRoutes.NEWS_ROUTE+AppRoutes.NEWS_DETAIL_ROUTE,arguments:controller.useProfile.articles[index]);
                  //controller.launchURL(controller.useProfile.articles[index].url);
                  Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE,arguments:controller.jobs[index]);
                },
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(5),
                  child: Card(
                    surfaceTintColor: Colors.grey.shade500,
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green,
                            child: Image.asset(
                              height: 20,
                              width: 20,
                              "assets/images/job.png",
                              color: Colors.white,
                            ),
                          ),Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.jobs[index].jobTitle,textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xff25503f)),),
                                  Text("\$${controller.jobs[index].salaryMin} - \$${controller.jobs[index].salaryMax}",textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff25503f)),),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("${controller.jobs[index].jobType}",textAlign: TextAlign.start,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.black),),
                                      SizedBox(width: 20,),
                                      Expanded(child:  Text("${controller.jobs[index].company}",textAlign: TextAlign.start,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.black87),),),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
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