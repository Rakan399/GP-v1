class UserModel {
  final String? uid;
  final String? email;
  final String? password;
  final String? shortAddress;
  final String? name;
  final String? token;

  UserModel(
      {this.uid,
      this.email,
      this.password,
      this.shortAddress,
      this.name,
      this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        email: json['email'],
        password: json['password'],
        shortAddress: json['shortAddress'],
        name: json['name'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'shortAddress': shortAddress,
      'name': name,
      'token': token, //.......
    };
  }
}
