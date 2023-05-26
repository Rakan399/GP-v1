import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:myapp/Cont/Usercont.dart';
import 'package:myapp/page-1/mainscreen.dart';

class mail_var_screen extends StatefulWidget {
  const mail_var_screen({super.key});

  @override
  State<mail_var_screen> createState() => _mail_var_screenState();
}

class _mail_var_screenState extends State<mail_var_screen> {
  bool isverified = false;
  Timer? timer;
  Usercont usercont = Get.find<Usercont>();
  @override
  void initState() {
    isverified = usercont.auth.currentUser!.emailVerified;
    if (!isverified) {
      send_verification_email();
      timer = Timer.periodic(Duration(seconds: 3), (_) => check_email());
    }
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return isverified
        ? mainscreen()
        : Scaffold(
            body: Center(
            child: Text(
              "please check your email",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
  }
}
