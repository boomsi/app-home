import 'package:demo/widgets/card_block.dart';
import 'package:flutter/material.dart';
import 'package:demo/utils/color.dart';
import 'package:get/get.dart';
import 'package:demo/controller/home.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorStore.homePageBK,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              CardBlockWidget(data: c.data[index]),
          itemCount: c.data.length,
        ));
  }
}
