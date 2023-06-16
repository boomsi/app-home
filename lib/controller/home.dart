import 'package:get/get.dart';

class BaseData {
  final String id;
  final String title;
  final String subtitle;
  final String fav;
  final List<String> imgs;
  final String content;
  final String groupId;

  BaseData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.fav,
    required this.imgs,
    required this.content,
    required this.groupId,
  });
}

class HomeController extends GetxController {
  final List<BaseData> data = [
    BaseData(
        id: '1',
        fav: 'assets/images/default_fav.png',
        title: '法盲互动小组1',
        subtitle: '发布讨论',
        imgs: [
          'assets/images/default_fav.png',
        ],
        groupId: '11',
        content:
            '今年也44岁了，依旧保持单身的状态。随着时间的推移，我渐渐意识到了我所失去的时间和错过的人，各种负责的心情涌上心头，所以去年年底我做出了一个很重要的决定。'),
    BaseData(
        id: '2',
        fav: 'assets/images/default_fav.png',
        title: '法盲互动小组1',
        subtitle: '发布讨论',
        imgs: [
          'assets/images/default_fav.png',
          'assets/images/default_fav.png'
        ],
        groupId: '22',
        content:
            '今年也44岁了，依旧保持单身的状态。随着时间的推移，我渐渐意识到了我所失去的时间和错过的人，各种负责的心情涌上心头，所以去年年底我做出了一个很重要的决定。'),
    BaseData(
        id: '3',
        fav: 'assets/images/default_fav.png',
        title: '法盲互动小组1',
        subtitle: '发布讨论',
        imgs: [
          'assets/images/default_fav.png',
          'assets/images/default_fav.png',
          'assets/images/default_fav.png'
        ],
        groupId: '33',
        content:
            '今年也44岁了，依旧保持单身的状态。随着时间的推移，我渐渐意识到了我所失去的时间和错过的人，各种负责的心情涌上心头，所以去年年底我做出了一个很重要的决定。'),
    BaseData(
        id: '4',
        fav: 'assets/images/default_fav.png',
        title: '法盲互动小组1',
        subtitle: '发布讨论',
        imgs: [],
        groupId: '44',
        content:
            '今年也44岁了，依旧保持单身的状态。随着时间的推移，我渐渐意识到了我所失去的时间和错过的人，各种负责的心情涌上心头，所以去年年底我做出了一个很重要的决定。')
  ].obs;
}
