import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../network/RestAPI.dart';
import 'model/news_entity_entity.dart';


class NewsController extends GetxController{

  ScrollController scrollController = ScrollController();
  ScrollController scrollControllerTwo = ScrollController();

  final RestAPI restAPI = Get.find<RestAPI>();
  var isDataLoading = false.obs;
  var isDataLoadingTwo = false.obs;
  late NewsEntityEntity useProfile;
  late NewsEntityEntity latestArticles;
  late NewsEntityArticles articles;

  @override
  void onInit() {
    super.onInit();
    loadLatestNews();
    //Timer.periodic(Duration(seconds: 20), (Timer t) => loadLatestNews());
  }

  void loadLatestNews() async {
      var header = { "Content-Type": "application/json;"};
      isDataLoading.value = true;
      String response = await restAPI.getDataMethodWithQotes("https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=d7f7717f4d3d49a39fd95900794c64ea", header);
      print("NEWS RESPONSE IS" + response.toString());
       var data = jsonDecode(response);
      useProfile = NewsEntityEntity.fromJson(data);
      isDataLoading.value = false;

      loadLatestArticles();
  }

  void loadLatestArticles() async {
    var header = { "Content-Type": "application/json;"};
    isDataLoading.value = true;
    String response = await restAPI.getDataMethodWithQotes("https://newsapi.org/v2/everything?q=technology&sortBy=publishedAt&apiKey=d7f7717f4d3d49a39fd95900794c64ea", header);
    print("NEWS ARTICLE RESPONSE IS" + response.toString());
    var data = jsonDecode(response);
    latestArticles = NewsEntityEntity.fromJson(data);
    isDataLoading.value = false;
  }

  void checkArguments(){
      if(Get.arguments!=null) {
        isDataLoadingTwo.value = true;
        if (Get.arguments is NewsEntityArticles) {
          articles = Get.arguments as NewsEntityArticles;
          isDataLoadingTwo.value = false;
        }
      }
  }
  @override
  void onClose() {
    super.onClose();
  }

  launchURL(String ur) async {
    final Uri url = Uri.parse(ur);
    if (await launchUrl(url)) {
      //throw Exception('Could not launch $url');
    }
  }


}