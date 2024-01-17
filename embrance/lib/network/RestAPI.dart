//Create a file: rest_api.dart
import 'dart:convert';

import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
class RestAPI{
  final GetConnect connect = Get.find<GetConnect>();
  //GET request example
  Future<dynamic> getDataMethod(String url,Map<String,String> header) async {
    try {
      Response response = await connect.get(url, headers: header);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    }catch(e){
      print(e);
    }
  }
  Future<dynamic> getDataMethodWithQotes(String url,Map<String,String> header) async {
    try {
      Response response = await connect.get(url, headers: header);
      if (response.statusCode == 200) {
        var unescape = HtmlUnescape();
        var text = unescape.convert(response.bodyString!);
        return text;
      } else {
        return null;
      }
    }catch(e){
      print(e);
    }
  }
  //post request example
  Future<dynamic> postDataMethod(String url,FormData formData) async {
    //body data
    Response response = await connect.post(url, formData);
    if(response.statusCode == 200) {
      return response.body;
    }else{
      return null;
    }
  }
}