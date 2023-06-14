import 'package:demo/controller/home.dart';
import 'package:flutter/material.dart';
import 'package:demo/utils/color.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController c = Get.put(HomeController());

  Widget _itemBuilder(BuildContext context, int index) {
    final item = c.data[index];

    return Container(
        color: ColorStore.usualBK,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
            width: double.infinity,
            // height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          width: 40,
                          height: 40,
                          item['fav']!,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            // width: double.infinity,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title']!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    item['subtitle']!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: ColorStore.usualGreyColor),
                                  )
                                ]),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: const Icon(Icons.more_horiz),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.red,
                  child: RichText(
                      text: TextSpan(
                    text: item['content']!,
                    style: const TextStyle(
                        color: ColorStore.usualColor, fontSize: 16),
                  )),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.fingerprint),
                      Icon(Icons.comment),
                      Icon(Icons.share)
                    ],
                  ),
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorStore.homePageBK,
        // color: Colors.red,
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: c.data.length,
        ));
  }
}
