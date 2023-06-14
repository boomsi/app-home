import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:demo/controller/main.dart';
import 'package:demo/utils/enum.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/profile.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainController c = Get.put(MainController(), tag: 'main');

  BottomNavigationBarItem _buildBottomNavigationItem(
      {required IconData icon, required title}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }

  void switchRoute(int index) {
    c.changeBottomRoute(index);
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: [
            _buildBottomNavigationItem(
                icon: Icons.home, title: bottomItemNames[BottomItemTitle.home]),
            _buildBottomNavigationItem(
                icon: Icons.man, title: bottomItemNames[BottomItemTitle.self]),
          ],
          onTap: switchRoute,
          selectedItemColor: Colors.blue,
          currentIndex:
              BottomItemTitle.values.indexOf(c.currenBottomNavigationBar.value),
        ));
  }

  Widget _buildBody() {
    return {
      BottomItemTitle.home: HomePage(),
      BottomItemTitle.self: ProfilePage()
    }[c.currenBottomNavigationBar]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Clicks: ${c.count}')),
      ),
      body: Center(
        child: Obx(_buildBody),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
