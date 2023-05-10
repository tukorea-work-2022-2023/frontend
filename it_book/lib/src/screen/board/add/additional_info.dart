import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../home.dart';

class AdditionalInfo extends StatefulWidget {
  const AdditionalInfo({super.key});

  @override
  State<AdditionalInfo> createState() => _AdditionalInfoState();
}

class _AdditionalInfoState extends State<AdditionalInfo> {
  //추가된 내용 부분 ----------------------------------------------------------------------------------
  void _saveBookInfo() async {
    final String username = "";
    final String password = "";
    final String auth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    final Map<String, String> headers = {
      'Authorization': auth,
      'Content-Type': 'application/json',
    };

    // 입력된 데이터 가져오기
    if (_formKey.currentState!.validate()) {
      String title = bookInfo['title'];
      String author = bookInfo['author'];
      String publisher = bookInfo['publisher'];
      String publishedDate = _publishedDateController.text;
      String price = _priceController.text;
      String content = _contentController.text;
      String state = _stateController.text; //책 상태 임시
      String summary = _summaryController.text;

      // 데이터를 Map으로 만들기
      Map data = {
        "title": title,
        "writer": author,
        "publisher": publisher,
        "created_at": publishedDate,
        "sell_price": price,
        "content": content,
        "state": state,
        "summary": summary,
      };

      // 데이터를 서버로 전송하기
      var response = await http.post(Uri.parse("http://:8080/home/bookPost/"),
          headers: headers, body: jsonEncode(data));

      // 서버 응답 확인
      if (response.statusCode == 200) {
        // 서버로부터 성공적인 응답을 받았을 때 수행할 로직
        print("Book information saved successfully.");
      } else {
        // 서버로부터 오류 응답을 받았을 때 수행할 로직
        print(
            "Failed to save book information. Error code: ${response.statusCode}");
      }
      Get.off(() => Home());
    }
  }

  //여기까지  -----------------------------------------------------------------------------------------------

  final Map<String, dynamic> bookInfo = Get.arguments;

  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _coverUrlController = TextEditingController();

  final TextEditingController _publishedDateController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _stateController =
      TextEditingController(); //책 상태 표시 임시
  final TextEditingController _summaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('책 정보 입력'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  bookInfo['title'],
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  bookInfo['author'],
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  bookInfo['publisher'],
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _publishedDateController,
                decoration: InputDecoration(
                  labelText: '출판일',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? '출판일을 입력해주세요.' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: '가격을 정해주세요',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? '가격을 입력해주세요.' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: '책 소개',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? '소개를 입력해주세요.' : null,
              ),
              SizedBox(height: 10),
              // 책 상태 임시
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: '책 상태',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? '상태를 입력해주세요.' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _summaryController,
                decoration: InputDecoration(
                  labelText: '책 요약',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? '요약을 입력해주세요.' : null,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _saveBookInfo,
                child: Text('저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
