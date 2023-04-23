import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class BookWrite extends StatefulWidget {
  const BookWrite({super.key});

  @override
  State<BookWrite> createState() => _BookWriteState();
}

class _BookWriteState extends State<BookWrite> {
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
        Uri.parse(
            'http://58.127.47.87:8080/home/barcode_bookInfo/?ItemId=$isbn'),
        headers: {
          'Authorization': 'Token 71fedd33d994131004e7c597e658a1ab415bbc15'
        },
      );
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
    _fetchBookInfo(isbn);
    print(isbn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Info')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_bookInfo != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(_bookInfo!['cover']),
                  SizedBox(height: 16),
                  Text(_bookInfo!['title'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            if (_errorMessage != null)
              Text(_errorMessage!, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
