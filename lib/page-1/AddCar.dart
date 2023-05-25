import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/Home.dart';
import 'package:myapp/utils.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../Cont/Carcont.dart';

class AddCar extends StatefulWidget {
  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  List<dynamic> ComanyCar = [];
  List<dynamic> ModelType = [];
  List<dynamic> Model_Type = [];
  List<dynamic> Car_Color = [];
  String? CompanyCarID;
  String? ModelTypeID;
  String? CarColorID;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.ComanyCar.add({"id": 1, "label": "TOYOTA"});
    this.ComanyCar.add({"id": 2, "label": "GMC"});
    this.ComanyCar.add({"id": 3, "label": "NISSAN"});
    this.ComanyCar.add({"id": 4, "label": "FORD"});
    this.ComanyCar.add({"id": 5, "label": "LEXUS"});
    this.ModelType = [
      {"ID": 1, "Name": "Innova", "ParentId": 1},
      {"ID": 2, "Name": "Camry", "ParentId": 1},
      {"ID": 3, "Name": "FJ", "ParentId": 1},
      {"ID": 4, "Name": "Rav4", "ParentId": 1},
      {"ID": 1, "Name": "Yukon", "ParentId": 2},
      {"ID": 2, "Name": "Sierra", "ParentId": 2},
      {"ID": 3, "Name": "Acadia", "ParentId": 2},
      {"ID": 4, "Name": "Savana", "ParentId": 2},
      {"ID": 1, "Name": "Xterra", "ParentId": 3},
      {"ID": 2, "Name": "Altima", "ParentId": 3},
      {"ID": 3, "Name": "Maxima", "ParentId": 3},
      {"ID": 4, "Name": "Patrol", "ParentId": 3},
      {"ID": 1, "Name": "Explorer", "ParentId": 4},
      {"ID": 2, "Name": "Expedition", "ParentId": 4},
      {"ID": 3, "Name": "Taurus", "ParentId": 4},
      {"ID": 4, "Name": "Raptor", "ParentId": 4},
      {"ID": 1, "Name": "Lx570", "ParentId": 5},
      {"ID": 2, "Name": "Ls500", "ParentId": 5},
      {"ID": 3, "Name": "Es350", "ParentId": 5},
      {"ID": 4, "Name": "Nx300", "ParentId": 5},
    ];
    this.Car_Color.add({"id": 1, "Color": "Red"});
    this.Car_Color.add({"id": 2, "Color": "Blue"});
    this.Car_Color.add({"id": 3, "Color": "Green"});
    this.Car_Color.add({"id": 4, "Color": "Black"});
    this.Car_Color.add({"id": 5, "Color": "Gray"});
    this.Car_Color.add({"id": 6, "Color": "White"});
    this.Car_Color.add({"id": 7, "Color": "Yellow"});
  }

  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Size size = MediaQuery.of(context).size;
    return GetBuilder<car>(
        init: Get.put(car()),
        builder: (controller) {
          return Container(
            width: double.infinity,
            child: Container(
              // androidlarge2hLh (3:2)
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffff),
              ),

              child: Scaffold(
                body: SingleChildScrollView(
                  child: Form(
                    key: form,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                          // addcarb7K (37:128)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 200 * fem, 0 * fem),
                          child: Text(
                            'Add Car',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 28 * fem,
                              fontWeight: FontWeight.w800,
                              height: 0.2125 * ffem / fem,
                              color: Color(0xff7095b5),
                            ),
                          ),
                        ),
                        FormHelper.dropDownWidgetWithLabel(
                          context,
                          "",
                          "Select Company Car",
                          this.CompanyCarID,
                          this.ComanyCar,
                          (onChangedVaL) {
                            this.CompanyCarID = onChangedVaL;
                            print("Select CompanyCar: $onChangedVaL");

                            this.Model_Type = this
                                .ModelType
                                .where(
                                  (stateItem) =>
                                      stateItem["ParentId"].toString() ==
                                      onChangedVaL.toString(),
                                )
                                .toList();
                            this.ModelTypeID = null;
                            setState(() {});
                          },
                          (onValidateVaL) {
                            if (onValidateVaL == null) {
                              return 'Plase Select CompanyCar';
                            }
                            return null;
                          },
                          borderColor: Theme.of(context).primaryColor,
                          borderFocusColor: Theme.of(context).primaryColor,
                          borderRadius: 10,
                          optionValue: "id",
                          optionLabel: "label",
                        ),
                        FormHelper.dropDownWidgetWithLabel(
                          context,
                          "",
                          "Select Model Type",
                          this.ModelTypeID,
                          this.Model_Type,
                          (onChangedVaL) {
                            this.ModelTypeID = onChangedVaL;
                            print("Select Model Type: $onChangedVaL");
                          },
                          (onValidateVaL) {
                            return null;
                          },
                          borderColor: Theme.of(context).primaryColor,
                          borderFocusColor: Theme.of(context).primaryColor,
                          borderRadius: 10,
                          optionValue: "ID",
                          optionLabel: "Name",
                        ),
                        FormHelper.dropDownWidgetWithLabel(
                          context,
                          "",
                          "Select Car Color",
                          this.CarColorID,
                          this.Car_Color,
                          (onChangedVaL) {
                            this.CarColorID = onChangedVaL;
                            print("Select Car Color: $onChangedVaL");
                          },
                          (onValidateVaL) {
                            if (onValidateVaL == null) {
                              return 'Plase Select Car Color';
                            }
                            return null;
                          },
                          borderColor: Theme.of(context).primaryColor,
                          borderFocusColor: Theme.of(context).primaryColor,
                          borderRadius: 10,
                          optionValue: "id",
                          optionLabel: "Color",
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                      hintText: 'Plate Number',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 50,
                                width: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xff7095b5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    Icon(Icons.camera_alt, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              44 * fem, 0 * fem, 42 * fem, 0 * fem),
                          width: double.infinity,
                          height: 45 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff7095b5),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),

                          // autogroupzibfNt5 (3RLmeFYAPv9zvfppY5ZiBf)
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Color(0xffffffff),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {
                              if (CompanyCarID == null) {
                                Get.snackbar("Cannot Continue",
                                    "Please Select The Company");
                              } else if (ModelTypeID == null) {
                                Get.snackbar("Cannot Continue",
                                    "Please Select The Model Type");
                              } else if (CarColorID == null) {
                                Get.snackbar("Cannot Continue",
                                    "Please Select The Car Color");
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              44 * fem, 0 * fem, 42 * fem, 0 * fem),
                          width: double.infinity,
                          height: 45 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff7095b5),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),

                          // autogroupzibfNt5 (3RLmeFYAPv9zvfppY5ZiBf)
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Color(0xffffffff),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Back'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });

    return Container(width: double.infinity, child: Container());
  }
}
