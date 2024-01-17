import 'package:embrance/network/SocketConnection.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';


import '../component/SqliteService.dart';
import 'RestAPI.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());
    Get.put<RestAPI>(RestAPI()); //initializing REST API class
    Get.put(SocketConnection());
    Get.put(SqliteService());
  }
}