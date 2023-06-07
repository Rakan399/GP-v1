import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Cont/Usercont.dart';
import 'package:myapp/page-1/My_Car.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/page-1/Signup.dart';
import 'package:myapp/page-1/forgot_password.dart';
import 'package:myapp/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/Home.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();
  final auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return GetBuilder<Usercont>(
        init: Get.find<Usercont>(),
        builder: (controller) {
          return Container(
            // androidlarge5Ne1 (30:24)
            width: double.infinity,
            height: 800 * fem,
            decoration: BoxDecoration(
              color: Color(0xff7095b5),
            ),
            child: Scaffold(
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
                              'Login',
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
                              controller: controller.emailcontroller,
                              onChanged: (value) {
                                _email = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextField(
                              controller: controller.passwordcontroller,
                              onChanged: (value) {
                                _password = value;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                controller.Login();
                              },
                              child:
                                  Text('Login') /*onPressed: onPressedSubmit*/
                              ),
                          SizedBox(height: 12),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "You don't have an account? ",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  InkWell(
                                    onTap: () => Get.to(() => Signup()),
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(color: Colors.lightBlue),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () => Get.to(() => forgot_password()),
                                child: Text(
                                  "forgot your password ",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
