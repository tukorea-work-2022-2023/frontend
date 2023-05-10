import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:it_book/src/screen/board/add/additional_info.dart';

class BookWrite extends StatefulWidget {
  const BookWrite({super.key});

  @override
  State<BookWrite> createState() => _BookWriteState();
}

class _BookWriteState extends State<BookWrite> {
  TextEditingController _isbnController = TextEditingController(); //추가
  Map<String, dynamic>? _bookInfo;
  String? _errorMessage;
  bool _isLoading = false;

  Future<void> _fetchBookInfo(String isbn) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.get(
        Uri.parse('http://:8080/home/barcode_bookInfo/?ItemId=$isbn'),
        headers: {
          'Authorization': 'Token' //토큰값 받아오는거 수정 & 컨트롤러랑 레포로 관리
        },
      );
      final contentType = response.headers['content-type'];
      if (contentType != null && contentType.contains('charset=')) {
        final charset = contentType.split('charset=')[1];
        if (charset.toLowerCase() != 'utf-8') {
          print('Unsupported charset: $charset');
        }
      } else {
        response.headers['content-type'] = 'application/json; charset=utf-8';
      }
      if (response.statusCode == 200) {
        setState(() {
          _bookInfo = json.decode(response.body)['message'];
        });
      } else {
        throw Exception('Failed to load book info!!!!!!');
      }
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    } finally {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final isbn = Get.arguments as String;
    _isbnController.text = isbn; //ISBN 값이 있으면 해당 값을 TextField에 삽입
    _fetchBookInfo(isbn);
    print(isbn);
  }

  @override //추가
  void dispose() {
    _isbnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('책 등록하기')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // color: Colors.blue,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '등록하실 책을 검색하세요.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextField(
                    controller: _isbnController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 122, 122, 122),
                          width: 1.0,
                        ),
                      ),
                      hintText: _isbnController.text.isEmpty
                          ? '책 이름 또는 ISBN을 입력하세요'
                          : null, // 추가
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {}, //검색기능 추가 예정
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // _searchTerm = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            if (_bookInfo != null)
              GestureDetector(
                onTap: () {
                  Get.to(() => AdditionalInfo(), arguments: _bookInfo);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(_bookInfo!['cover']),
                    SizedBox(width: 14),
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _bookInfo!['title'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "ISBN : " + _isbnController.text,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "저자 : " + _bookInfo!['author'],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "출판사 : " + _bookInfo!['publisher'],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (_errorMessage != null)
              Text(_errorMessage!, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
