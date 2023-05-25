import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Utils/binding.dart';
import 'package:myapp/page-1/AddCar.dart';
import 'package:myapp/page-1/Home.dart';
import 'package:myapp/page-1/Logo.dart';
import 'package:myapp/page-1/SuspiciouCar.dart';

import 'package:myapp/utils.dart';
import 'package:myapp/page-1/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Logo(),
    );
  }
}
