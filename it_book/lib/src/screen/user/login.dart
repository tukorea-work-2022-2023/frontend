import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:it_book/src/screen/home.dart';
import 'package:it_book/src/screen/user/find.dart';
import 'package:it_book/src/screen/user/register.dart';

import '../../controller/user_controller.dart';

final userController = Get.put(UserController());

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      String? message = await userController.login(email, password);
      if (message == null) {
        Get.off(() => const Home());
      } else {
        Get.snackbar("로그인 에러", message, snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

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
                height: 15,
              ),
              Row(
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Get.off(() => const Register());
                      },
                      child: Text('Register'))
                ],
              ),
              Row(
                children: [
                  Text("Forgot ID/PW?"),
                  TextButton(
                      onPressed: () {
                        Get.off(() => const Find());
                      },
                      child: Text('Find ID/PW'))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: '아이디(이메일)'),
                validator: (String? value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "아이디를 입력해주세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
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
                  onPressed: () {
                    var createPage = MaterialPageRoute(builder: (c) => Home());
                    Navigator.push(context, createPage);
                  }, //submit으로 교체
                  child: Text('로그인'))
            ],
          )),
        ),
      ),
    );
  }
}
