import 'package:embrance/component/pageroute.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashController extends GetxController{

  final user = GetStorage();
  @override
  void onInit() {
    
    if(user.read("username")!=null){

      Future.delayed(const Duration(milliseconds: 1000), () {
        //Navigator.of(context, rootNavigator: true).pop();
        if(user.read("user_type")=="3"){
          Get.offAllNamed(AppRoutes.DASHBOARD_ROUTE+AppRoutes.ALUMNI_CONNECT_ROUTE,arguments: 1);
        }else{
          Get.offAllNamed(AppRoutes.DASHBOARD_ROUTE,);
        }

      });

      
    }else{
       Future.delayed(const Duration(milliseconds: 1000), () {
        //Navigator.of(context, rootNavigator: true).pop();
        Get.offAllNamed(AppRoutes.LOGIN_ROUTE,);

      });
    }

    super.onInit();
  }
}