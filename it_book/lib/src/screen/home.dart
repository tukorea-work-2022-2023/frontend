import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:it_book/src/screen/board/board.dart';
import 'package:it_book/src/screen/header/setting.dart';

import 'chat/chat.dart';
import 'header/noti.dart';
import 'header/search.dart';
import 'lecture/lecture.dart';
import 'major/major.dart';
import 'mypage/mypage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name = Get.arguments;
  late int _currentPageIndex;

  void initState() {
    super.initState();
    _currentPageIndex = 2;
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text(
        name,
      ),
      actions: [
        IconButton(
            onPressed: () {
              var createPage = MaterialPageRoute(builder: (c) => Search());
              Navigator.push(context, createPage);
            },
            icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              var createPage = MaterialPageRoute(builder: (c) => Noti());
              Navigator.push(context, createPage);
            },
            icon: Icon(Icons.notifications_active)),
        IconButton(
            onPressed: () {
              var createPage = MaterialPageRoute(builder: (c) => Setting());
              Navigator.push(context, createPage);
            },
            icon: Icon(Icons.settings))
      ],
    );
  }

  final List<Widget> _widgetOptions = <Widget>[
    Major(),
    Lecture(),
    Board(),
    Chat(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  Widget _bottomNavigationBarwidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
      selectedFontSize: 12,
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu_book),
            ),
            label: "전공"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.smart_display),
            ),
            label: "강의"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.home),
            ),
            label: "HOME"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.question_answer),
            ),
            label: "채팅"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person),
            ),
            label: "마이 페이지"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: SafeArea(
        child: _widgetOptions.elementAt(_currentPageIndex),
      ),
      bottomNavigationBar: _bottomNavigationBarwidget(),
    );
  }
}
