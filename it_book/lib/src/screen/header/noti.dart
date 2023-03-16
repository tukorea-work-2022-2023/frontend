import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "알림",
      ),
      actions: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Row(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("활동 알림")),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(onPressed: () {}, child: Text("키워드 알림")),
        ],
      ),
    );
  }
}
