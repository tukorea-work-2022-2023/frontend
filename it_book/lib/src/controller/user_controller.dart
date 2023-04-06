import 'package:get/get.dart';
import 'package:it_book/src/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/user_repository.dart';

class UserController extends GetxController {
  final userRepo = Get.put(UserRepository());
  UserModel? userOne;

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return (token != null) ? token : '';
  }

  Future<String?> register(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    Map body = await userRepo.register(name, email, password);

    if (body['result'] == 'success') {
      prefs.setString('token', body['token']);
      return null;
    } else {
      return body['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    Map body = await userRepo.login(email, password);
    if (body['result'] == 'success') {
      prefs.setString('token', body['token']);
      return null;
    } else {
      return body['message'];
    }
  }
}
