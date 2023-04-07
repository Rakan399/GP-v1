import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/AddCar.dart';
import 'package:myapp/page-1/SuspiciouCar.dart';
import 'package:myapp/page-1/DefectiveCar.dart';
import 'package:myapp/page-1/NavigationDrawerWidget.dart';

class Home extends StatelessWidget {
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
              backgroundColor: Color(0xff7095b5),
              appBar: AppBar(
                title: Text(""),
                backgroundColor: Color(0xff7095b5),
              ),
              body: Column(
                children: [
                  Container(
                    // image25kZ (30:5)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 50 * fem, 0 * fem, 0 * fem),
                    width: 200 * fem,
                    height: 70 * fem,
                    child: Image.asset(
                      'assets/page-1/images/image-2-beV.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Positioned(
                    // autogroupfvmfBjs (3RLcGmejmhrkUpsTpjfVMf)

                    left: 36 * fem,
                    top: 260 * fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: double.infinity,
                      // width: 288 * fem,
                      height: 96 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // rectangle8ssb (30:99)
                            margin: EdgeInsets.fromLTRB(
                                40 * fem, 0 * fem, 40 * fem, 0 * fem),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AddCar()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 116 * fem,
                                height: 96 * fem,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                  child: Image.asset(
                                    'assets/page-1/images/rectangle-8.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            // rectangle9KDo (30:100)
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 116 * fem,
                              height: 96 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5 * fem),
                                child: Image.asset(
                                  'assets/page-1/images/rectangle-9.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Positioned(
                    // autogroupfvmfBjs (3RLcGmejmhrkUpsTpjfVMf)

                    left: 36 * fem,
                    top: 260 * fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: double.infinity,
                      // width: 288 * fem,
                      height: 96 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // rectangle8ssb (30:99)
                            margin: EdgeInsets.fromLTRB(
                                40 * fem, 0 * fem, 40 * fem, 0 * fem),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SuspiciouCar()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 116 * fem,
                                height: 96 * fem,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                  child: Image.asset(
                                    'assets/page-1/images/rectangle-10.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            // rectangle11vN1 (30:102)
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DefectiveCar()));
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 116 * fem,
                              height: 96 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5 * fem),
                                child: Image.asset(
                                  'assets/page-1/images/rectangle-11.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
