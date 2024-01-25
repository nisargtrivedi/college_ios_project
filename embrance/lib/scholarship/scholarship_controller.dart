import 'dart:convert';

import 'package:embrance/network/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../network/RestAPI.dart';
import 'model/scholarship_entity.dart';

class ScholarShipController extends GetxController{

  List<ScholarshipEntity> list= <ScholarshipEntity>[].obs;
  var isDataLoading = false.obs;
  ScrollController scrollController = ScrollController();
  final RestAPI restAPI = Get.find<RestAPI>();
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    var header = { "Content-Type": "application/json;"};
    isDataLoading.value = true;
    String response = await restAPI.getDataMethod(Constant.GET_ALL_SCOLARSHIP, header);
    print("SCHOLARSHIP RESPONSE IS" + response.toString());
    var data = jsonDecode(Uri.decodeComponent(response));
    list = data.map<ScholarshipEntity>((json) => ScholarshipEntity.fromJson(json)).toList();
    isDataLoading.value = false;

  }
  launchURL(String ur) async {
    final Uri url = Uri.parse(ur);
    if (await launchUrl(url)) {
      //throw Exception('Could not launch $url');
    }
  }
}