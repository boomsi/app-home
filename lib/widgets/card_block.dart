import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:demo/controller/card_block.dart';
import 'package:demo/controller/home.dart';
import 'package:demo/utils/color.dart';
import 'package:demo/widgets/more_options_bottom_sheet.dart';

class CardBlockWidget extends StatelessWidget {
  CardBlockWidget({Key? key, required this.data}) : super(key: key);

  final BaseData data;
  final CardBlockController c = Get.put(CardBlockController());

  Widget _buildHead(BuildContext context) {
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
                      GestureDetector(
                        onTap: () {
                          c.jumpToGroupDetail(id: data.groupId);
                        },
                        child: Text(
                          data.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // c.jumpToGroupDetail(id: data.groupId);
                        },
                        child: Text(
                          data.subtitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 14, color: ColorStore.usualGreyColor),
                        ),
                      )
                    ]),
              )),
          MoreOptionsBottomSheet(
            childList: [
              BottomChild(title: '投诉', onPress: () {}),
              BottomChild(title: '不想看', onPress: () {}),
              BottomChild(title: '收藏', onPress: () {}),
            ],
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
        c.jumpToDetail(id: data.id);
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
                children: [_buildHead(context), _buildBody(), _buildFoot()],
              ))),
    );
  }
}
