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
  var value = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("도서 작성"),
      ),
      body: Container(child: Text(value)),
    );
  }
}
