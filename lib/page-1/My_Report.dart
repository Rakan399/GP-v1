import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/NavigationDrawerWidget.dart';
import 'package:myapp/utils.dart';

class My_Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

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
                drawer: NavigationDrawerWidget(),
                backgroundColor: Color(0xfffffffff),
                appBar: AppBar(
                  title: Text(""),
                  backgroundColor: Color(0xff7095b5),
                ),
                body: Column(
                  children: [
                    Container(
                      // image25kZ (30:5)
                      margin: EdgeInsets.fromLTRB(
                          80 * fem, 50 * fem, 0 * fem, 0 * fem),
                      width: 200 * fem,
                      height: 70 * fem,
                      child: Image.asset(
                        'assets/page-1/images/image-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      // myreportFNd (48:77)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 100 * fem, 0 * fem),
                      child: Text(
                        'My Reports',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 28 * ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.2125 * ffem / fem,
                          color: Color(0xff7095b5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));

    return Container(width: double.infinity, child: Container());
  }
}
