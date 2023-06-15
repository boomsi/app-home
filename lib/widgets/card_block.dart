import 'package:demo/controller/home.dart';
import 'package:demo/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardBlockWidget extends StatelessWidget {
  const CardBlockWidget({Key? key, required this.data}) : super(key: key);

  final BaseData data;

  Widget _buildHead() {
    return Container(
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
              data.fav.toString(),
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
                        data.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        data.subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 14, color: ColorStore.usualGreyColor),
                      )
                    ]),
              )),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: const Icon(Icons.more_horiz),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return RichText(
        text: TextSpan(
      text: data.content,
      style: const TextStyle(color: ColorStore.usualColor, fontSize: 16),
    ));
  }

  Widget _buildFoot() {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.thumb_up_off_alt_outlined),
          Icon(Icons.comment),
          Icon(Icons.share)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/detail');
      },
      child: Container(
          color: ColorStore.usualBK,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
              width: double.infinity,
              // height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buildHead(), _buildBody(), _buildFoot()],
              ))),
    );
  }
}
