import 'package:get/get.dart';

class maincont extends GetxController {
  int index = 0;
  onChangeIndex(value) {
    index = value;
    update();
  }
}
