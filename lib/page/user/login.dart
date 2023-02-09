import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:it_book/page/user/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "로그인",
      ),
      actions: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
              // key: _formkey,
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        var createPage =
                            MaterialPageRoute(builder: (c) => Register());
                        Navigator.push(context, createPage);
                      },
                      child: Text('Register'))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // controller: _emailController,
                decoration: InputDecoration(labelText: '아이디(이메일)'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "아이디를 입력해주세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                // controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '비밀번호'),
                validator: (value) {
                  //value로 전달하는 value값의 조건 확인
                  if (value == null || value!.trim().isEmpty) {
                    return "비밀번호를 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {},
                  child: Text('로그인'))
            ],
          )),
        ),
      ),
    );
  }
}
