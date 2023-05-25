import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Cont/local_storage.dart';
import 'package:myapp/Model/UserModel.dart';

import '../Cont/Usercont.dart';

class Settings_Screen extends StatefulWidget {
  const Settings_Screen({super.key});

  @override
  State<Settings_Screen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  final Local_Storage = Get.find<local_storage>();
  final usercont = Get.find<Usercont>();

  @override
  void initState() {
    onOpen_setting();
    super.initState();
  }

  onOpen_setting() {
    UserModel user = Local_Storage.Get_UserModel();
    print(user.toJson());
    usercont.namecontroller.text = user.name!;
    usercont.emailcontroller.text = user.email!;
    usercont.passwordcontroller.text = user.password!;
    usercont.Short_addersscontroller.text = user.shortAddress!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Usercont>(
        init: Get.find<Usercont>(),
        builder: (controller) {
          return Scaffold(
            body: controller.loading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(color: Colors.black87, fontSize: 35),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            onChanged: (value) {},
                            controller: controller.namecontroller,
                            decoration: InputDecoration(
                                hintText: '',
                                label: Text("name"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            enabled: false,
                            onChanged: (value) {},
                            controller: controller.emailcontroller,
                            decoration: InputDecoration(
                                label: Text("email"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            onChanged: (value) {},
                            controller: controller.Short_addersscontroller,
                            decoration: InputDecoration(
                                label: Text("short address"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            onChanged: (value) {},
                            controller: controller.passwordcontroller,
                            decoration: InputDecoration(
                                label: Text("password"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => controller.UpdateUseriInfo(),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff7095b5)),
                            alignment: Alignment.center,
                            child: Text(
                              "Save",
                              style:
                                  TextStyle(fontSize: 23, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          );
        });
  }
}
