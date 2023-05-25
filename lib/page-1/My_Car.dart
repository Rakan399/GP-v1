import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Cont/Carcont.dart';
import 'package:myapp/Utils/Constant.dart';
import 'package:myapp/Utils/Helpers.dart';
import 'package:myapp/page-1/NavigationDrawerWidget.dart';
import 'package:myapp/utils.dart';

class My_Car extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return GetBuilder<car>(
        init: Get.find<car>(),
        builder: (controller) {
          return SizedBox(
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
                      body: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            // myreportFNd (48:77)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 200 * fem, 0 * fem),
                            child: Text(
                              'My Cars',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 28 * ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff7095b5),
                              ),
                            ),
                          ),
                          Expanded(
                              child: controller.loading.value
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: ListView(
                                          children: controller.cars
                                              .map((car) => Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 7.5,
                                                            horizontal: 12.5),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                      vertical: 5,
                                                    ),
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color:
                                                              Color(0xff7095b5),
                                                        )),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Plate: ${car.PlateNumber}",
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                                "Company:${car.CompanyCar} "),
                                                            Text(
                                                                "Model:${car.ModelCar} "),
                                                            Text(
                                                                "Color:${car.CarColor} "),
                                                            Text(
                                                                "Status: ${car.status}",
                                                                style: TextStyle(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                    color: get_color_by_status(
                                                                        car.status!))),
                                                          ],
                                                        ),
                                                        Row(children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              controller
                                                                  .missing_car(
                                                                      car,
                                                                      statuses
                                                                          .missing
                                                                          .name);
                                                            },
                                                            icon: Icon(
                                                              Icons.report,
                                                              color:
                                                                  Colors.yellow,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              controller
                                                                  .delete_car(
                                                                      car);
                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ]),
                                                      ],
                                                    ),
                                                  ))
                                              .toList())))
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });

    return Container(width: double.infinity, child: Container());
  }
}
