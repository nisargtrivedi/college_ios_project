
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    height: height/7,
                    width: width,
                    color:const Color(0xff25503f),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.7,
                      decoration: decoration(Colors.green),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            height: 80,
                            width: 80,
                            "assets/images/job.png",
                            color: Colors.white,
                          ),
                          Text("Let's Get Ready",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),),
                          Text("For your dream Jobs",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex:3,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: width,
                alignment: Alignment.centerLeft,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0,),
                  child: Text("JOBS CATEGORY",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                height:200,
                child: Obx(
                      ()=> controller.isDataLoading.value ? CircularProgressIndicator():
                  ListView.builder(
                    reverse: false,
                    controller: controller.scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.jobs.length,
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        width: width/2,
                        padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                        child: InkWell(
                          onTap: ()=> Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_ROUTE,arguments:controller.jobs[index].jobCategory ),
                          child: Card(
                            surfaceTintColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.green,
                                  child: Image.asset(
                                    height: 20,
                                    width: 20,
                                    "assets/images/job.png",
                                    color: Colors.white,
                                  ),
                                ),Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(controller.jobs[index].jobCategory,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xff25503f)),),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                width: width,
                alignment: Alignment.centerLeft,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0,),
                  child: Text("POPULAR SEARCH",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
                ),

              ),
              Container(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                height:200,
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
                          Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_ROUTE,arguments:controller.jobs[index].jobCategory);
                        },
                        child: Container(
                          width: width,
                          padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                          child: Card(
                            surfaceTintColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
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
                                      child: Text(controller.jobs[index].jobCategory,textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xff25503f)),),
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
            ],
          ))
        ],
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