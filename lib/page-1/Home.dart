import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Cont/local_storage.dart';
import 'package:myapp/Cont/maincont.dart';
import 'package:myapp/page-1/Missing.dart';
import 'package:myapp/page-1/My_Car.dart';
import 'package:myapp/page-1/My_Report.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/AddCar.dart';
import 'package:myapp/page-1/Report.dart';
import 'package:myapp/page-1/DefectiveCar.dart';
import 'package:myapp/page-1/NavigationDrawerWidget.dart';

import '../Cont/Usercont.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final maincont maincontroller = Get.find<maincont>();

  @override
  Widget build(BuildContext context) {
    //double baseWidth = 360;
    //double fem = MediaQuery.of(context).size.width / baseWidth;
    //double ffem = fem * 0.97;
    Size size = MediaQuery.of(context).size;

    return GetBuilder<Usercont>(
        init: Get.find<Usercont>(),
        builder: (controller) {
          return Container(
            width: double.infinity,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                // androidlarge5Ne1 (30:24)
                width: double.infinity,
                //  height: 200 * fem,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          SizedBox(height: 50),
                          GetBuilder<local_storage>(
                              init: Get.find<local_storage>(),
                              builder: (local_storage_controller) {
                                return Container(
                                  child: Text(
                                    local_storage_controller.Get_UserModel()
                                            .name ??
                                        "",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(height: 20),
                          Expanded(
                            child: GridView(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 40.0,
                              ),
                              children: [
                                [
                                  "assets/page-1/images/rectangle-8.png",
                                  0,
                                  AddCar()
                                ],
                                [
                                  "assets/page-1/images/rectangle-9.png",
                                  0,
                                  Missing()
                                ],
                                ["assets/page-1/images/My_cars.png", 1, 1],
                                [
                                  "assets/page-1/images/REPORT.png",
                                  0,
                                  Report()
                                ],
                              ]
                                  .map((data) => InkWell(
                                        onTap: () {
                                          if (data[1] as int == 0) {
                                            Get.to(() => data[2] as Widget);
                                          } else {
                                            maincontroller.onChangeIndex(1);
                                          }
                                        },
                                        child: Container(
                                          width: size.width * 0.5,
                                          height: size.width * 0.35,
                                          padding: EdgeInsets.all(5),
                                          //margin: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Color(0xff7095b5),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Image.asset(data[0] as String),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
        });
  }
}
