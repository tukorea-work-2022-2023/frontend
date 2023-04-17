import 'package:get/get.dart';

import '../shared/global.dart';

class UserRepository extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.API_ROOT;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

//Map을 dynamic으로
  Future<Map> register(
      String name, String email, String password, String password2) async {
    Response response = await post(
      //여기 아래 줄 주소 변경
      "account/signup/",
      {
        'username': name,
        'email': email,
        'password': password,
        'password2': password2,
      },
    );
    print(response.body);
    return response.body;
  }

  Future<Map> login(String name, String password) async {
    Response response = await post(
      "account/signin/",
      {
        'username': name,
        'password': password,
      },
    );
    print("리포");
    print(response.body);
    return response.body;
  }
}
