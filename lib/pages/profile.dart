import 'package:demo/controller/profile.dart';
import 'package:demo/utils/color.dart';
import 'package:demo/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfileController c = Get.find();

  Widget _buildSettingsItem({required String title, required IconData icon}) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 8),
            color: ColorStore.usualBK,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: ColorStore.usualGreyColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Text(title),
                      )
                    ],
                  ),
                  const Icon(Icons.chevron_right_sharp)
                ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStore.homePageBK,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Obx(() => Text('${c.data["nickname"]}')),
                        Obx(() =>
                            Text('${sexNames[Sex.values[c.data["sex"]]]}'))
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                        width: 40, height: 40, 'assets/images/default_fav.png'),
                  )
                ],
              ),
            ),
          ),
          _buildSettingsItem(title: '收藏', icon: Icons.bookmark),
          _buildSettingsItem(title: '浏览历史', icon: Icons.history_sharp),
          _buildSettingsItem(title: '设置', icon: Icons.settings),
          _buildSettingsItem(title: '关于', icon: Icons.apps_sharp),
          _buildSettingsItem(title: '帮助反馈', icon: Icons.question_answer),
        ],
      ),
    );
  }
}
