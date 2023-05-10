import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Lecture extends StatefulWidget {
  const Lecture({super.key});

  @override
  State<Lecture> createState() => _LectureState();
}

class _LectureState extends State<Lecture> {
  List<dynamic> _videoList = [];

  Future<void> _fetchVideoList() async {
    final response = await http.get(
        Uri.parse('http://:8080/class/video_list/?VideoName=자바'),
        headers: {'Authorization': 'Token'});
    final contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains('charset=')) {
      final charset = contentType.split('charset=')[1];
      if (charset.toLowerCase() != 'utf-8') {
        print('Unsupported charset: $charset');
      }
    } else {
      response.headers['content-type'] = 'application/json; charset=utf-8';
    }
    final jsonData = json.decode(response.body) as List<dynamic>;
    setState(() {
      _videoList = jsonData;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchVideoList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _videoList.length,
              itemBuilder: (context, index) {
                final video = _videoList[index];
                return ListTile(
                  title: Text(video['title']),
                  subtitle: Text(video['created']),
                  trailing: Text('${video['view']} views'),
                  onTap: () {
                    // Handle video item tap
                  },
                );
              },
            ),
    );
  }
}
