import 'package:embrance/dashboard/dashboard_controller.dart';
import 'package:embrance/home/alumni_connect/alumni_chat_controller.dart';
import 'package:embrance/home/alumni_connect/alumni_controller.dart';
import 'package:embrance/jobs/jobs_controller.dart';
import 'package:embrance/jobs/jobs_detail_controller.dart';
import 'package:embrance/news/news_controller.dart';
import 'package:embrance/notifications/notification_controller.dart';
import 'package:embrance/profile/profile_controller.dart';
import 'package:embrance/profile/splash/splash_controller.dart';
import 'package:embrance/scholarship/scholarship_controller.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => (DashboardController()));
    Get.lazyPut<HomeController>(() => (HomeController()));
    Get.lazyPut<NewsController>(() => (NewsController()));
    Get.lazyPut<ProfileController>(() => (ProfileController()));
    Get.lazyPut<NotificationController>(() => (NotificationController()));
    Get.lazyPut<AlumniController>(() => (AlumniController()));
    Get.lazyPut<SplashController>(() => (SplashController()));
    Get.lazyPut<AlumniChatController>(() => (AlumniChatController()));
    Get.lazyPut<JobsController>(() => (JobsController()));
    Get.lazyPut<JobsDetailController>(() => (JobsDetailController()));
    Get.lazyPut<ScholarShipController>(() => (ScholarShipController()));
  }
}