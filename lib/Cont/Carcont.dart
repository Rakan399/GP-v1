import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/carModel.dart';

class car extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void Add_car(car_model car) {
    _firebaseFirestore.collection("Car").add(car.tojson());
  }
}
