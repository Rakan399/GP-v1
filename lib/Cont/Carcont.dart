import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Model/UserModel.dart';
import 'package:myapp/Utils/Constant.dart';
import 'package:myapp/Utils/Helpers.dart';

import '../Model/carModel.dart';
import 'local_storage.dart';

class car extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController platenumbercontroller = TextEditingController();
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<car_model> cars = [];
  @override
  void onInit() {
    get_cars();
    super.onInit();
  }

  void Add_car(car_model car) {
    loading.value = true;
    update();
    _firebaseFirestore
        .collection("Car")
        .doc(car.PlateNumber! + car.CompanyCar!)
        .set(car.tojson());
    loading.value = false;
    update();
  }

  void image_car() async {
    loading.value = true;
    update();
    try {
      final file = await onPickImage();
      platenumbercontroller.text = await onGetPlateNumber(file);
    } catch (e) {
      print("Something is wrong $e");
    }
    loading.value = false;
    update();
  }

  get_cars() async {
    loading.value = true;
    update();
    UserModel userModel = Get.find<local_storage>().Get_UserModel();
    cars = await _firebaseFirestore
        .collection("Car")
        .where("user.email", isEqualTo: userModel.email)
        .get()
        .then((value) =>
            value.docs.map((car) => car_model.fromjson(car)).toList())
        .onError((error, stackTrace) {
      Get.snackbar("something went wrong with fetching data", error.toString());
      print(error.toString());
      return [];
    });
    loading.value = false;

    update();
  }

  delete_car(car_model car) {
    loading.value = true;
    update();
    _firebaseFirestore
        .collection("Car")
        .doc(car.PlateNumber! + car.CompanyCar!)
        .delete();
    loading.value = false;
    update();
    get_cars();
  }

  missing_car(car_model car, String status) {
    loading.value = true;
    update();
    _firebaseFirestore
        .collection("Car")
        .doc(car.PlateNumber! + car.CompanyCar!)
        .update({"status": status});
    loading.value = false;
    update();
    get_cars();
  }
}
