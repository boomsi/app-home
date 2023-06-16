import 'package:get/get.dart';

class CardBlockController extends GetxController {
  void jumpToDetail({required String id}) {
    Get.toNamed('/detail', parameters: {'id': id});
  }

  void jumpToGroupDetail({required String id}) {
    Get.toNamed('/group/detail', parameters: {'id': id});
  }
}
