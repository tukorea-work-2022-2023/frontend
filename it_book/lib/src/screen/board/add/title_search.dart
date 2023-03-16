import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TitleSearch extends StatefulWidget {
  const TitleSearch({super.key});

  @override
  State<TitleSearch> createState() => _TitleSearchState();
}

class _TitleSearchState extends State<TitleSearch> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "책 검색",
      ),
      actions: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      // body: ,
    );
  }
}
