import 'package:demo/controller/home.dart';
import 'package:demo/controller/profile.dart';
import 'package:demo/pages/group_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:demo/main_page.dart';
import 'package:demo/pages/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteGet.home,
      getPages: RouteGet.getPages,
      // home: MainPage()
    );
  }
}

class RouteGet {
  static const String home = '/';
  static const String detail = '/detail';
  static const String groupDetail = '/group/detail';

  static final List<GetPage> getPages = [
    GetPage(
        name: home,
        page: () => MainPage(),
        binding: BindingsBuilder(() {
          Get.put<HomeController>(HomeController());
          Get.put<ProfileController>(ProfileController());
        })),
    GetPage(name: detail, page: () => DetailPage()),
    GetPage(name: groupDetail, page: () => GroupDetailPage())
  ];
}
