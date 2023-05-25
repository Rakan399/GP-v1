import 'package:get/get.dart';
import 'package:myapp/Cont/Carcont.dart';
import 'package:myapp/Cont/ReportCont.dart';
import 'package:myapp/Cont/Usercont.dart';
import 'package:myapp/Cont/local_storage.dart';

import '../Cont/maincont.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => local_storage());
    Get.lazyPut(() => Usercont(), fenix: true);
    Get.lazyPut(() => car(), fenix: true);
    Get.lazyPut(() => Report_cont(), fenix: true);
    Get.lazyPut(() => maincont(), fenix: true);
  }
}
