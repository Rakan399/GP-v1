import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Cont/Usercont.dart';
import 'package:myapp/page-1/Login.dart';
import 'package:myapp/page-1/NavigationDrawerWidget.dart';
import 'package:myapp/utils.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign up',
      theme: ThemeData(brightness: Brightness.light),
      home: const FormPage(title: 'Sign up'),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool isverified = false;
  bool isEmailSend = false;
  Timer? timer;
  Usercont usercont = Get.find<Usercont>();

  onLogin() {
    isverified = usercont.auth.currentUser!.emailVerified;
    if (!isverified) {
      send_verification_email();
      verifecation_box();
      timer = Timer.periodic(Duration(seconds: 3), (_) => check_email());
    }
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  check_email() async {
    await usercont.auth.currentUser!.reload();
    setState(() {
      isverified = usercont.auth.currentUser!.emailVerified;
    });
    if (isverified) {
      timer!.cancel();
    }
  }

  send_verification_email() async {
    final user = usercont.auth.currentUser;
    await user!.sendEmailVerification();
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

  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return GetBuilder<Usercont>(
        init: Get.find<Usercont>(),
        builder: (controller) {
          return Container(
            width: double.infinity,
            child: Container(
              // androidlarge5Ne1 (30:24)
              width: double.infinity,
              height: 800 * fem,
              decoration: BoxDecoration(
                color: Color(0xff7095b5),
              ),

              child: Stack(
                children: [
                  Scaffold(
                    backgroundColor: Color(0xffffffff),
                    body: controller.loading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(
                                        9 * fem, 6 * fem, 14 * fem, 0 * fem),
                                    width: double.infinity),
                                Container(
                                  // image25kZ (30:5)
                                  margin: EdgeInsets.fromLTRB(
                                      5 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  width: 170 * fem,
                                  height: 100 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/image-1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  // welcomeMAM (18:8)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 250 * fem, 0 * fem),
                                  child: Text(
                                    'SignUp',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w800,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xff7095b5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextField(
                                    onChanged: (value) {},
                                    controller: controller.namecontroller,
                                    decoration: InputDecoration(
                                        hintText: 'Name',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextField(
                                    onChanged: (value) {},
                                    controller: controller.emailcontroller,
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextField(
                                    onChanged: (value) {},
                                    controller: controller.passwordcontroller,
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextField(
                                    onChanged: (value) {},
                                    controller:
                                        controller.Short_addersscontroller,
                                    decoration: InputDecoration(
                                        hintText: 'Short adderss',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      controller.signup();
                                    },
                                    child: const Text(
                                        'Sign Up') /*onPressed: onPressedSubmit*/
                                    ),
                                SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account? ",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    InkWell(
                                      onTap: () => Get.to(() => Login()),
                                      child: Text(
                                        "Login",
                                        style:
                                            TextStyle(color: Colors.lightBlue),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
