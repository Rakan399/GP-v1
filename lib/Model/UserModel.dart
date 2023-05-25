class UserModel {
  final String? uid;
  final String? email;
  final String? password;
  final String? shortAddress;
  final String? name;

  UserModel(
      {this.uid, this.email, this.password, this.shortAddress, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
      shortAddress: json['shortAddress'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'shortAddress': shortAddress,
      'name': name, //.......
    };
  }
}
