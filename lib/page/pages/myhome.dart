import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:it_book/page/book/add.dart';
import 'package:it_book/page/feed/item.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var createPage = MaterialPageRoute(builder: (c) => Add());
          Navigator.push(context, createPage);
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              height: 100,
              width: 390,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ' 카테고리',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text('# c')),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('# c ++')),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('# c #')),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('# java')),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('# java')),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('# java')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                '등록되어 있는 책',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
        ],
      ),
    );
  }
}
