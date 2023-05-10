import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TitleSearch extends StatefulWidget {
  const TitleSearch({super.key});

  @override
  State<TitleSearch> createState() => _TitleSearchState();
}

class _TitleSearchState extends State<TitleSearch> {
  String _searchTerm = '';
  List<String> _searchResults = [];

  void _searchBooks() {
    // 검색 로직을 작성합니다. 검색 결과를 _searchResults 변수에 저장합니다.
    // 검색 결과는 책의 제목, ISBN 등의 정보가 포함된 문자열 리스트로 나타냅니다.
  }

  void _registerBook(String bookTitle) {
    // 등록 로직을 작성합니다.
    // bookTitle 변수에 선택한 책의 제목을 전달합니다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('책 등록하기'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: '책 이름 또는 ISBN을 입력하세요',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _searchBooks,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchTerm = value;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                final bookTitle = _searchResults[index];
                return ListTile(
                  title: Text(bookTitle),
                  onTap: () {
                    _registerBook(bookTitle);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
