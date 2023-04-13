class UserEntity {
  int? id;
  String? username;
  String? password;
  String? token;
  UserEntity({this.id, this.username, this.password, this.token});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'token': token,
    };
  }

  UserEntity.formJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    token = json['token'];
  }
}
