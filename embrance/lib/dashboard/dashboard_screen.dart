
import 'package:embrance/component/bottombar.dart';
import 'package:embrance/dashboard/dashboard_controller.dart';
import 'package:embrance/home/home_screen.dart';
import 'package:embrance/news/news_screen.dart';
import 'package:embrance/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../notifications/notification_screen.dart';

class DashboardView extends StatelessWidget{
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(init: Get.put<DashboardController>(DashboardController()),builder: (controller){
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.bottomTabIndex,
              children: [
                HomeView(),
                NewsView(),
                NotificationView(),
                ProfileView()
          ]),

        ),bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          onTap: controller.selectedBottomBarTabIndex,
          currentIndex: controller.bottomTabIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            bottomBar(CupertinoIcons.home,"Home"),
            bottomBar(CupertinoIcons.news,"News"),
            bottomBar(CupertinoIcons.bell,"Notification"),
            bottomBar(CupertinoIcons.profile_circled,"Profile"),
          ]),
      );
    });
  }


}