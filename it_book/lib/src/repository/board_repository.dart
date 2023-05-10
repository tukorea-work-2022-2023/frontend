import 'dart:convert';

import 'package:get/get.dart';
import 'package:it_book/src/controller/user_controller.dart';

import '../shared/global.dart';

class BoardRepository extends GetConnect {
  final userController = Get.put(UserController());

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

  Future<List?> feedIndex() async {
    Response response = await get(
      "home/bookPost",
      headers: {'token': await userController.getToken()},
    );
    return (response.statusCode == 200) ? response.body : null;
  }

  Future<Map<String, dynamic>> fetchBookInfo(String isbn) async {
    final response = await get(
      "home/barcode_bookInfo/?ItemId=$isbn",
      headers: {'token': await userController.getToken()},
    );
    // final contentType = response.headers['content-type'];
    // if (contentType != null && contentType.contains('charset=')) {
    //   final charset = contentType.split('charset=')[1];
    //   if (charset.toLowerCase() != 'utf-8') {
    //     print('Unsupported charset: $charset');
    //   }
    // } else {
    //   response.headers['content-type'] = 'application/json; charset=utf-8';
    // }
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['message'];
      return data;
    } else {
      throw Exception('Failed to load book info!');
    }
  }
}
