import 'package:flutter/material.dart';

class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('小组详情')),
      body: Container(child: Text('小组')),
    );
  }
}
