import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 10);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/Welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(),
    );
  }

  Widget content() {
    return Container(child: Lottie.asset('assets/page-1/Logo.mp4'));
  }
}
