import 'package:demo/utils/color.dart';
import 'package:flutter/material.dart';

const IconData defaultIcon = Icons.more_horiz;

class BottomChild {
  BottomChild({
    required this.title,
    required this.onPress,
  });

  final String title;
  final void Function() onPress;
}

class MoreOptionsBottomSheet extends StatelessWidget {
  const MoreOptionsBottomSheet(
      {Key? key, this.icon = defaultIcon, required this.childList})
      : super(key: key);

  final IconData icon;
  final List<BottomChild> childList;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      padding: const EdgeInsets.only(left: 8, right: 8),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return IntrinsicHeight(
              child: Container(
                  color: ColorStore.usualBK,
                  child: SafeArea(
                      bottom: true,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(childList.length, (index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      childList[index].onPress();
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        color: ColorStore.usualBK,
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        child: Center(
                                          child: Text(childList[index].title),
                                        )),
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: ColorStore.usualGreyColor,
                                  ),
                                ],
                              );
                            }, growable: false),
                            GestureDetector(
                              child: Container(
                                color: ColorStore.usualBK,
                                padding: const EdgeInsets.all(16),
                                child: const Center(child: Text('取消')),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ]))),
            );
          },
        );
      },
    );
  }
}
