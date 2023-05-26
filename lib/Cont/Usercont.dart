import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Cont/local_storage.dart';
import 'package:myapp/Model/UserModel.dart';
import 'package:myapp/page-1/Welcome.dart';
import 'package:myapp/page-1/mail_var.dart';
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
  bool isverified = false;

  Timer? timer;

  void signup() async {
    loading.value = true;
    update();
    try {
      var userc = await auth.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      user = userc.user;
      Add_user();
      isverified = auth.currentUser!.emailVerified;
      if (!isverified) {
        send_verification_email();
        timer = Timer.periodic(Duration(seconds: 3), (_) => check_email());
      }
      {}
    } catch (e) {
      Get.snackbar("erorr", e.toString());
    }
    loading.value = false;
    update();
  }

  check_email() async {
    await auth.currentUser!.reload();

    isverified = auth.currentUser!.emailVerified;

    if (isverified) {
      timer!.cancel();
      Get.offAll(() => mail_var_screen());
    }
  }

  send_verification_email() async {
    final user = auth.currentUser;
    await user!.sendEmailVerification();
    verifecation_box();
  }

  verifecation_box() {
    Get.dialog(
        Dialog(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Text("Please Verify Your Email"),
            ),
          ),
        ),
        barrierDismissible: false);
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

        Get.offAll(() => mail_var_screen());
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
      isverified = auth.currentUser!.emailVerified;
      if (!isverified) {
        send_verification_email();
        timer = Timer.periodic(Duration(seconds: 3), (_) => check_email());
      } else {
        Get.offAll(() => mainscreen());
      }
    } else {
      Get.offAll(() => Welcome());
    }
  }

  Logout() {
    auth.signOut();
    Local_Storage.remove_user();
    Get.offAll(() => Welcome());
  }

  restpassword() async {
    loading.value = true;
    update();

    try {
      await auth.sendPasswordResetEmail(email: emailcontroller.text);
      Get.snackbar("Email Sent Sucsessfully", "");
    } catch (e) {
      Get.snackbar("Something went wrong", e.toString());
    }
    loading.value = false;
    update();
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
