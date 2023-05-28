import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/Login.dart';
import 'package:myapp/page-1/Signup.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/AddCar.dart';
import 'package:myapp/page-1/Report.dart';

import 'package:myapp/page-1/NavigationDrawerWidget.dart';

class Welcome extends StatelessWidget {
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
              backgroundColor: Color(0xff7095b5),
              body: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(
                          9 * fem, 67 * fem, 14 * fem, 0 * fem),
                      width: double.infinity),
                  Container(
                    // welcomeMAM (18:8)
                    margin: EdgeInsets.fromLTRB(
                        16 * fem, 0 * fem, 0 * fem, 24 * fem),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontFamily: 'GreatVibes',
                        fontSize: 64 * ffem,
                        fontWeight: FontWeight.normal,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    // councilneighborhoodcarmonitori (17:5)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 42 * fem),
                    child: Text(
                      'Council Neighborhood Car Monitoring System',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    // image25kZ (30:5)
                    margin: EdgeInsets.fromLTRB(
                        5 * fem, 0 * fem, 0 * fem, 40 * fem),
                    width: 208 * fem,
                    height: 170 * fem,
                    child: Image.asset(
                      'assets/page-1/images/image-2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        44 * fem, 0 * fem, 42 * fem, 0 * fem),
                    width: double.infinity,
                    height: 63 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Color(0xff7095b5),
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Login()));
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        44 * fem, 0 * fem, 42 * fem, 0 * fem),
                    width: double.infinity,
                    height: 63 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Color(0xff7095b5),
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Signup()));
                      },
                      child: const Text('Sign up'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
