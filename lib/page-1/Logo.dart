import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/Cont/Usercont.dart';
import 'package:myapp/Cont/Usercont.dart';
import 'package:myapp/page-1/Home.dart';
import 'package:myapp/page-1/Welcome.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  final Usercont usercont = Get.find<Usercont>();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    Future.delayed(const Duration(seconds: 4), () {
      usercont.Home_Navigater();
    });
  }

  route() {
    Navigator.pushReplacementNamed(context, '/Welcome');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image(
              image: AssetImage('assets/page-1/App_Logo.gif'),
              width: size.width * 0.5), //......
        ),
      ),
    );
  }
}
