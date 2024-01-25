
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/pageroute.dart';
import 'jobs_controller.dart';
import 'jobs_detail_controller.dart';

class JobDetailView extends GetView<JobsDetailController>{

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=> JobsDetailController());

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
      body: SingleChildScrollView(
        controller: controller.scrollController,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width,
                  color: const Color(0xff25503f),
                  height: height*0.10,
                  child: Obx(()=> controller.name.value!=null ? Text(controller.name.value,style: TextStyle(fontSize: 28,color: Colors.white,),textAlign: TextAlign.center,):CircularProgressIndicator()),
                ),
                Obx(
                      ()=> controller.isDataLoading.value ? const CircularProgressIndicator():
                  ListView.builder(
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.jobsDetails.length,
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    itemBuilder: (context, index){
                      return Container(
                        width: width/2,
                        padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                        child: InkWell(
                          onTap: ()=> Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE+AppRoutes.JOBS_DETAIL_ROUTE+AppRoutes.JOBS_DETAIL_DETAIL_ROUTE,arguments:controller.jobsDetails[index]),
                          child: Card(
                            surfaceTintColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(controller.jobsDetails[index].jobTitle.replaceAll("+"," "),textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xff25503f)),),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

              ],
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