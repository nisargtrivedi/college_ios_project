
import 'package:embrance/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component/home_menu_box_decoration.dart';
import '../component/pageroute.dart';

class HomeView extends GetView<DashboardController> {

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
    print("TYPE---------------------------------"+controller.userType());

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                     width: width,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("HOME", style: TextStyle(color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                        Text("Welcome , ${controller.userName.value}",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      listItem("Job Discovery","assets/images/job_seeker.png","Alumni Connect","assets/images/alumni_connect.png",
                              (){
                          Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.JOBS_ROUTE);
                      } ,(){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE,arguments: 2);
                      }),
                      listItem((controller.userType()=="1")?"Senior Connect":"Junior Connect","assets/images/connect_senior.png","Scholarship Search","assets/images/scholarship.png",(){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE,arguments: 1);
                      },(){
                        Get.toNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.SCHOLARSHIP_ROUTE);
                      }),
                      listItem("News Feed", "assets/images/news_feed.png","Library","assets/images/library.jpeg",(){
                        controller.selectedBottomBarTabIndex(1);
                      },(){
                        final Uri url = Uri.parse("https://library.csus.edu/");
                        launchUrl(url);
                      }),

                      listItem("The Well", "assets/images/th_well.jpeg","Campus Safety","assets/images/campus.jpeg",(){
                        final Uri url = Uri.parse("https://thewellatsacstate.com/");
                        launchUrl(url);
                      },(){
                        final Uri url = Uri.parse("https://www.csus.edu/campus-safety/");
                        launchUrl(url);
                      })

                    ],
                  )
                )
              ]),

        )
    );
  }

  listItem(String menuOne,String imagePathOne,String menuTwo,String imagePathTwo,VoidCallback onclick,VoidCallback onclickTwo) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap:(){onclick();},
                    child: Container(
                      decoration: getMenuDecoration(),
                      child: Column(
                        children: [
                          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),child: Image(image: AssetImage(imagePathOne,),fit: BoxFit.fill,)),
                          Padding(
                            padding: EdgeInsets.only(top:5.0,bottom: 5.0),
                            child: Text(menuOne,style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap:(){onclickTwo();},
                    child: Container(
                      decoration: getMenuDecoration(),
                      child: Column(
                        children: [
                          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),child: Image(image: AssetImage(imagePathTwo,),fit: BoxFit.fill)),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                            child: Text(menuTwo,style: TextStyle(color: Colors.white),),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),

          ]),
    );
  }

  listItemTwo(String menuOne,String imagePathOne,VoidCallback onclick) {
    return InkWell(
      onTap: () => onclick(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: getMenuDecoration(),
                      child: Column(
                        children: [
                          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),child: Image(image: AssetImage(imagePathOne,),fit: BoxFit.fill)),
                          Padding(
                            padding: EdgeInsets.only(top:5.0,bottom: 5.0),
                            child: Text(menuOne,style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 1,),
                  Expanded(
                    flex: 3,child: Container(),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
    
            ]),
      ),
    );
  }
}
