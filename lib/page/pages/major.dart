import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Major extends StatefulWidget {
  const Major({super.key});

  @override
  State<Major> createState() => _MajorState();
}

class _MajorState extends State<Major> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('major'),
    );
  }
}
