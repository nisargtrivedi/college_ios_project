import 'package:embrance/component/pageroute.dart';
import 'package:embrance/home/alumni_connect/model/alumni_response_entity.dart';
import 'package:embrance/network/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alumni_controller.dart';



class AlumniConnectView extends StatelessWidget {

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
          appBar: AppBar(backgroundColor: Colors.green,title: Text(controller.pageName == 2 ? "Alumni Connect":"Senior Connect",style: TextStyle(color: Colors.white),),leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white),
            onPressed: () => Get.back(),
          ),),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              ()=> controller.isDataLoading.value  ? const CircularProgressIndicator() : loadAlumniList(controller,width),
            ),
          )
      );
    });
  }

  loadAlumniList(AlumniController controller,double width){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: 50,
            child: TextField(
              onChanged: (value){
                controller.searchFunction();
              },
              controller: controller.searchText,
              textAlign: TextAlign.start,
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.grey, width: 0.0),
                ),hintText: "Search",prefixIcon: Icon(Icons.search, color: Colors.black)),
            keyboardType: TextInputType.name,
            minLines: 1, //Normal textInputField will be displayed
            maxLines: 1, // when user presses enter it will adapt to it
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
              child: ListView.builder(
                  itemCount: controller.filterList.obs.value.length,
                  itemBuilder: (context, index) {
                    return listItem(controller.filterList.obs.value[index],width);
                  })
          )
        ]);
  }
  listItem(AlumniResponseEntity data, double width) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE+AppRoutes.ALUMNI_DETAIL_ROUTE,arguments: data);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(Constant.IMAGE_URL+data.avatar),),
                  SizedBox(width: 20,),
                  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${data.firstname} ${data.lastname}" ,style: const TextStyle(color: Colors.black,fontSize: 14),),
                      Text(data.course,style: const TextStyle(color: Colors.grey,fontSize: 12),),
                    ],
                  ),
                  Spacer(flex: 1,),
                  InkWell(onTap:(){
                    Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE+AppRoutes.ALUMNI_CONNECT_CHAT_ROUTE,arguments: data);
                  },child: Icon(Icons.message_outlined,color: Colors.black,)),
                  SizedBox(width: 10,),
                  InkWell(onTap:(){
                    Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE+AppRoutes.ALUMNI_CONNECT_SCHEDULE_ROUTE,arguments: data,);
                  },child: Icon(Icons.calendar_month_outlined,color: Colors.black,))
                ],
              ),
              const Divider(height: 10,color: Colors.grey,thickness: 0.5),

            ]),
      ),
    );
  }

}
