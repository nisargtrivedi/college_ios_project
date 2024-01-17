import 'package:embrance/component/root_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'component/pageroute.dart';
import 'network/DependencyInjection.dart';


void main() async{
  await GetStorage.init();
  runApp(const MyApp());
  DependencyInjection.init();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoutes(),
      initialRoute: AppRoutes.SPLASH_ROUTE,
      initialBinding: RootBinding()
    );
  }
}

