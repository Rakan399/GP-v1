import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Cont/local_storage.dart';
import 'package:myapp/Model/UserModel.dart';
import 'package:myapp/page-1/Welcome.dart';
import 'package:myapp/page-1/mainscreen.dart';
import '../page-1/Home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Usercont extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  final auth = FirebaseAuth.instance;
  final Local_Storage = Get.find<local_storage>();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  User? user;
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final Short_addersscontroller = TextEditingController();
  String username = " ";
//

  ///
  void signup() async {
    loading.value = true;
    update();
    try {
      var userc = await auth.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      user = userc.user;
      Add_user();
      Get.offAll(() => mainscreen());
      {}
    } catch (e) {
      Get.snackbar("erorr", e.toString());
    }
    loading.value = false;
    update();
  }

  Add_user() async {
    try {
      UserModel user_data = UserModel(
          token: await _firebaseMessaging.getToken(),
          uid: user!.uid,
          name: namecontroller.text,
          email: emailcontroller.text,
          password: passwordcontroller.text,
          shortAddress: Short_addersscontroller.text);
      await _firebaseFirestore
          .collection("Resident")
          .doc(user!.uid)
          .set(user_data.toJson());
      await Local_Storage.save_user(user_data);
      username = Local_Storage.Get_UserModel().name!;
    } catch (e) {
      Get.snackbar("erorr", e.toString());
    }
  }

  Login() async {
    loading.value = true;
    update();
    try {
      var user = await auth.signInWithEmailAndPassword(
        password: passwordcontroller.text,
        email: emailcontroller.text,
      );
      if (user != null) {
        UserModel userfetched = await fetchUser(auth.currentUser!.uid);
        await Local_Storage.save_user(userfetched);
        username = Local_Storage.Get_UserModel().name!;

        Get.offAll(() => mainscreen());
      }
    } catch (e) {
      print(e);
      Get.snackbar("erorr", e.toString());
    }
    loading.value = false;
    update();
  }

  Future<UserModel> fetchUser(userId) async {
    await _firebaseFirestore
        .collection("Resident")
        .doc(userId)
        .update({"token": await _firebaseMessaging.getToken()});
    return await _firebaseFirestore
        .collection("Resident")
        .doc(userId)
        .get()
        .then((value) => UserModel.fromJson(value.data()!));
  }

  Home_Navigater() {
    if (auth.currentUser != null) {
      Get.offAll(() => mainscreen());
    } else {
      Get.offAll(() => Welcome());
    }
  }

  Logout() {
    auth.signOut();
    Local_Storage.remove_user();
    Get.offAll(() => Welcome());
  }

  @override
  void onInit() {
    // username = Local_Storage.Get_UserModel().name!;
    super.onInit();
  }

  UpdateUseriInfo() async {
    loading.value = true;
    update();
    await _firebaseFirestore
        .collection("Resident")
        .doc(auth.currentUser!.uid)
        .update({
      "name": namecontroller.text,
      "password": passwordcontroller.text,
      "shortAddress": Short_addersscontroller.text
    });
    UserModel userf = await fetchUser(auth.currentUser!.uid);
    if (userf.password != passwordcontroller.text) {
      await auth.currentUser!.updatePassword(passwordcontroller.text);
    }
    Local_Storage.save_user(userf);
    username = Local_Storage.Get_UserModel().name!;

    Get.offAll(() => mainscreen());
    loading.value = false;
    update();
  }
}
