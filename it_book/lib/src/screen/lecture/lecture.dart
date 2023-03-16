import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Lecture extends StatefulWidget {
  const Lecture({super.key});

  @override
  State<Lecture> createState() => _LectureState();
}

class _LectureState extends State<Lecture> {
  final List<String> _valueList = [
    '카테고리를 선택하세요',
    'C',
    'JAVA',
    'Python',
    'C++',
    'Flutter',
    'React',
    "Django"
  ];
  String _selectedValue = '카테고리를 선택하세요';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            DropdownButton(
              value: _selectedValue,
              items: _valueList.map((value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 400,
              height: 630,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text("유튜브 영상 썸네일"),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '유튜브 영상 제목',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('유튜브 영상 조횟수'),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1.0,
                    width: 500.0,
                    color: Color.fromARGB(255, 212, 209, 209),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
