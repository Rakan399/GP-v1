import 'package:get/get.dart';
import 'package:myapp/Cont/Usercont.dart';
import 'package:myapp/Cont/local_storage.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => local_storage());
    Get.lazyPut(() => Usercont());
  }
}
