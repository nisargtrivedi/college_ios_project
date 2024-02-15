import 'package:embrance/component/pageroute.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../network/SocketConnection.dart';


class SplashController extends GetxController{

  final user = GetStorage();
  final SocketConnection socketConnection = Get.find<SocketConnection>();
  @override
  void onInit() {
    if(socketConnection.socket.disconnected){
      socketConnection.socket.connect();
    }
    if(user.read("username")!=null){
      Future.delayed(const Duration(milliseconds: 100), () {
        if(user.read("user_type")=="3" || user.read("gender")=="Male"){
          Get.offAllNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE,arguments: 1);
        }else{
          Get.offAllNamed(AppRoutes.DASHBOARD_ROUTE,);
        }
      });
    }else{
       Future.delayed(const Duration(milliseconds: 100), () {
        //Navigator.of(context, rootNavigator: true).pop();
        Get.offAllNamed(AppRoutes.LOGIN_ROUTE,);

      });
    }

    super.onInit();
  }
}