import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Cont/local_storage.dart';
import 'package:myapp/Model/UserModel.dart';
import 'package:myapp/page-1/Welcome.dart';
import 'package:myapp/page-1/mainscreen.dart';
import '../page-1/Home.dart';

class Usercont extends GetxController {
  final auth = FirebaseAuth.instance;
  final Local_Storage = Get.find<local_storage>();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  User? user;
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final Short_addersscontroller = TextEditingController();

  void signup() async {
    try {
      var userc = await auth.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text)!;
      user = userc.user;
      Add_user();
      Get.offAll(() => mainscreen());
      {}
    } catch (e) {
      Get.snackbar("erorr", e.toString());
    }
  }

  Add_user() {
    try {
      UserModel user_data = UserModel(
          name: namecontroller.text,
          email: emailcontroller.text,
          password: passwordcontroller.text,
          shortAddress: Short_addersscontroller.text);
      _firebaseFirestore
          .collection("Resident")
          .doc(user!.uid)
          .set(user_data.toJson());
      Local_Storage.save_user(user_data);
    } catch (e) {
      Get.snackbar("erorr", e.toString());
    }
  }

  Login() async {
    try {
      var user = await auth.signInWithEmailAndPassword(
        password: passwordcontroller.text,
        email: emailcontroller.text,
      );
      if (user != null) {
        UserModel userfetched = await fetchUser(user.user!.uid);
        Local_Storage.save_user(userfetched); //
        Get.offAll(() => mainscreen());
      }
    } catch (e) {
      print(e);
      Get.snackbar("erorr", e.toString());
    }
  }

  Future<UserModel> fetchUser(userId) async {
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
}
