import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

import '../../widget/book_prof.dart';
import 'add/how_to_write.dart';
import 'board_show.dart';

class Board extends StatefulWidget {
  // const Board({super.key});
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    //상태관리 하기 전 임시
    final username = ''; // 유저 이름
    final password = '!'; // 비밀번호

    final bytes = utf8.encode('$username:$password');
    final base64Str = base64.encode(bytes);
    final authStr = 'Basic $base64Str';
    try {
      final response = await http.get(
        Uri.parse('http://:8080/home/bookPost/'),
        headers: {'Authorization': authStr, 'Accept-Charset': 'UTF-8'},
      );

      final contentType = response.headers['content-type']; // 번역
      if (contentType != null && contentType.contains('charset=')) {
        final charset = contentType.split('charset=')[1];
        if (charset.toLowerCase() != 'utf-8') {
          print('Unsupported charset: $charset');
        }
      } else {
        response.headers['content-type'] = 'application/json; charset=utf-8';
      }

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          _posts = List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
        });
      } else {
        print('HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var createPage = MaterialPageRoute(builder: (c) => HowToWrite());
          Navigator.push(context, createPage);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BoardShow(post: post)),
              );
            },
            child: Container(
              padding: const EdgeInsetsDirectional.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // BookProf(),
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(post.state_image),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 250,
                                child: Text(
                                  post.title,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('저자 : ${post.writer}'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('출판 : ${post.publisher}'),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1.0,
                    width: 500.0,
                    color: const Color.fromARGB(255, 236, 235, 235),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Post {
  final int id;
  final int sell_price;
  final String title;
  final String writer;
  final String publisher;
  final String state;
  final String content;
  final String state_image;
  final List tags;

  Post({
    required this.id,
    required this.sell_price,
    required this.title,
    required this.writer,
    required this.publisher,
    required this.state,
    required this.content,
    required this.state_image,
    required this.tags,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      sell_price: json['sell_price'],
      title: json['title'] ?? '',
      writer: json['writer'] ?? '',
      publisher: json['publisher'] ?? '',
      state: json['state'] ?? '',
      content: json['content'] ?? '',
      state_image: json['state_image'] ?? '',
      tags: json['tags'],
    );
  }
}
