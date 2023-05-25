import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/Model/UserModel.dart';

class local_storage extends GetxController {
  final storage = GetStorage();
  void save_user(UserModel userModel) {
    storage.write("user", json.encode(userModel.toJson()));
  }

  UserModel Get_UserModel() {
    return UserModel.fromJson(json.decode(storage.read("user")));
  }

  void remove_user() {
    storage.remove("user");
  }
}
