import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:it_book/page/widget/profile.dart';
import 'package:it_book/page/widget/ranting_book.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  Widget _information() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MyProfile(),
                  SizedBox(
                    width: 10,
                  ),
                  Text("사용자 1"),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text('프로필 보기')),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _rentalBook() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "대여중인 도서",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text("전체 보기",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)))
            ],
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) => RantingBook()).toList(),
          ),
        ),
      ],
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              // color: Colors.grey[600]
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _information(),
            _rentalBook(),
            Divider(
              height: 40,
              thickness: 8,
              color: Colors.grey[200],
            ),
            buildAccountOption(context, "내가 등록한 도서"),
            buildAccountOption(context, "찜한 도서"),
            buildAccountOption(context, "내가 작성한 리뷰"),
            buildAccountOption(context, "문의하기"),
          ],
        ),
      ),
    );
  }
}
