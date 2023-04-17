class UserModel {
  String? name;
  String? email;
  String? password;
  String? password2;

  UserModel.parse(Map m) {
    name = m['user_name'];
    email = m['user_id'];
    password = m['user_passwd'];
    password2 = m['user_passwd2'];
  }
}
