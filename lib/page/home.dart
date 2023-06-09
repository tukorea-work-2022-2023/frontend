import 'package:flutter/material.dart';
import 'package:it_book/page/book/add.dart';
import 'package:it_book/page/notification/noti.dart';
import 'package:it_book/page/pages/chat.dart';
import 'package:it_book/page/pages/lecture.dart';
import 'package:it_book/page/pages/major.dart';
import 'package:it_book/page/pages/myhome.dart';
import 'package:it_book/page/pages/mypage.dart';
import 'package:it_book/page/search/search.dart';
import 'package:it_book/page/user/login.dart';

import 'feed/item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentPageIndex;

  void initState() {
    super.initState();
    _currentPageIndex = 2;
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      centerTitle: false,
      title: Text(
        "  IT-Book",
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
              var createPage = MaterialPageRoute(builder: (c) => Login());
              Navigator.push(context, createPage);
            },
            icon: Icon(Icons.settings)),
        IconButton(
            onPressed: () {
              var createPage = MaterialPageRoute(builder: (c) => Noti());
              Navigator.push(context, createPage);
            },
            icon: Icon(Icons.notifications_active))
      ],
    );
  }

  final List<Widget> _widgetOptions = <Widget>[
    Major(),
    Lecture(),
    MyHome(),
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
