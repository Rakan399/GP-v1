import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/Model/UserModel.dart';

class local_storage extends GetxController {
  final storage = GetStorage();
  save_user(UserModel userModel) async {
    await storage.write("user", json.encode(userModel.toJson()));
  }

  UserModel Get_UserModel() {
    UserModel user = UserModel.fromJson(json.decode(storage.read("user")));
    update();
    return user;
  }

  void remove_user() {
    storage.remove("user");
  }

  @override
  void onInit() {
//    Get_UserModel();
    super.onInit();
  }
}
