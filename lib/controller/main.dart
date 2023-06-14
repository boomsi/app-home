import 'package:get/get.dart';
import 'package:demo/utils/enum.dart';

class MainController extends GetxController {
  var count = 0.obs;
  var currenBottomNavigationBar = BottomItemTitle.home.obs;

  increment() => count++;

  changeBottomRoute(int index) =>
      currenBottomNavigationBar(BottomItemTitle.values[index]);
}
