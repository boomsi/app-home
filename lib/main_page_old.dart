import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:demo/controller/main.dart';
import 'package:demo/utils/enum.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/profile.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainController c = Get.put(MainController(), tag: 'main');

  Widget _buildNavigationBar(
      {required IconData icon,
      required IconData selectedIcon,
      required String label}) {
    return NavigationDestination(
        icon: Icon(icon), label: label, selectedIcon: Icon(selectedIcon));
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => NavigationBar(
          destinations: [
            _buildNavigationBar(
                icon: Icons.home_outlined,
                label: bottomItemNames[BottomItemTitle.home]!,
                selectedIcon: Icons.home),
            _buildNavigationBar(
                icon: Icons.manage_accounts_outlined,
                label: bottomItemNames[BottomItemTitle.self]!,
                selectedIcon: Icons.manage_accounts_sharp),
          ],
          onDestinationSelected: c.changeBottomRoute,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex:
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
        title:
            Obx(() => Text('${bottomItemNames[c.currenBottomNavigationBar]}')),
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
