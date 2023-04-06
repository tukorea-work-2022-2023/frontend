class UserModel {
  String? name;
  String? email;
  String? password;

  UserModel.parse(Map m) {
    name = m['user_name'];
    email = m['user_id'];
    password = m['user_passwd'];
  }
}
