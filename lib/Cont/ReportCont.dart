import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/Model/UserModel.dart';
import 'package:myapp/Utils/Constant.dart';
import 'package:myapp/Utils/Helpers.dart';
import '../Model/ReportModel.dart';
import '../Model/carModel.dart';
import 'local_storage.dart';

class Report_cont extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController platenumbercontroller = TextEditingController();
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<ReportModel> reports = [];
  List<ReportModel> missings = [];
  @override
  void onInit() {
    get_reports();
    get_missing();
    super.onInit();
  }

  void Add_report(ReportModel report) {
    loading.value = true;
    update();
    _firebaseFirestore
        .collection("Report")
        .add(report.tojson())
        .then((value) => null)
        .onError((error, stackTrace) {
      print(error.toString());
    });

    loading.value = false;
    update();
  }

  void image_report() async {
    loading.value = true;
    update();
    try {
      final file = await onPickImage(await use_image_type());
      platenumbercontroller.text = await onGetPlateNumber(file);
    } catch (e) {
      print("Something is wrong $e");
    }
    loading.value = false;
    update();
  }

  get_reports() async {
    loading.value = true;
    update();
    UserModel userModel = Get.find<local_storage>().Get_UserModel();
    reports = await _firebaseFirestore
        .collection("Report")
        .where("reporter.uid", isEqualTo: userModel.uid)
        .get()
        .then((value) =>
            value.docs.map((report) => ReportModel.fromjson(report)).toList())
        .onError((error, stackTrace) {
      Get.snackbar("something went wrong with fetching data", error.toString());
      print(error.toString());
      return [];
    });
    loading.value = false;

    update();
  }

  get_missing() async {
    loading.value = true;
    update();
    UserModel userModel = Get.find<local_storage>().Get_UserModel();
    var data = await _firebaseFirestore
        .collection("Report")
        .where("owner.uid", isEqualTo: userModel.uid)
        .get();
    missings = data.docs.map((report) => ReportModel.fromjson(report)).toList();
    // print(data.docs[0].data());

    loading.value = false;

    update();
  }

  use_image_type() async {
    return await Get.dialog(
        Dialog(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back(result: ImageSource.gallery);
                      },
                      child: Text("Garlley")),
                  InkWell(
                      onTap: () {
                        Get.back(result: ImageSource.camera);
                      },
                      child: Text("Camera")),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
