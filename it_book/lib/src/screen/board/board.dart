import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:it_book/src/screen/board/item2.dart';

import 'add/book_write.dart';
import 'item.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var createPage = MaterialPageRoute(builder: (c) => BookWrite());
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
          Container(
            height: 1.0,
            width: 500.0,
            color: Color.fromARGB(255, 236, 235, 235),
          ),
          FeedItem2(),
          Container(
            height: 1.0,
            width: 500.0,
            color: Color.fromARGB(255, 236, 235, 235),
          ),
        ],
      ),
    );
  }
}
