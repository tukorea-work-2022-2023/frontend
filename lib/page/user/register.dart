import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "회원가입",
      ),
      actions: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Form(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    '이름',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '이름을 입력해주세요'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "이름을 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    '아이디 (이메일)',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '아이디를 입력해주세요'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "아이디를 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    '비밀번호',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '영문, 숫자, 특수문자를 1개이상 조합하여 8자리 이상을 입력해주세요',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: '비밀번호를 입력해주세요'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "비밀번호를 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    '비밀번호 확인',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: '비밀번호를 다시 한번 입력해주세요'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "비밀번호를 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(45),
                  ),
                  onPressed: () {},
                  child: Text('가입하기'))
            ],
          )),
        ),
      ),
    );
  }
}
