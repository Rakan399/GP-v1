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

class forgot_password extends StatelessWidget {
  forgot_password({Key? key}) : super(key: key);

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
                                      0 * fem, 0 * fem, 200 * fem, 0 * fem),
                                  child: Text(
                                    'Reset password',
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
                                ElevatedButton(
                                    onPressed: () async {
                                      controller.restpassword();
                                      Get.back();
                                    },
                                    child: const Text(
                                        'Reset password') /*onPressed: onPressedSubmit*/
                                    ),
                                SizedBox(height: 14),
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
