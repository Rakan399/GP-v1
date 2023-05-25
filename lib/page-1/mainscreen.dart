import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:myapp/Cont/Usercont.dart';
import 'package:myapp/page-1/Home.dart';
import 'package:myapp/page-1/My_Car.dart';
import 'package:myapp/page-1/My_Report.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return Home();
      case 1:
        return My_Car();
      case 2:
        return My_Report();
      case 3:
        return Container();
      default:
        return Container();
    }
  }

  int index = 0;

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 65,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Color(0xff7095b5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(),
                Spacer(),
                Image.asset(
                  "assets/page-1/images/Logo_b.png",
                  color: Colors.white,
                ),
                Spacer(),
                InkWell(
                  onTap: () => Get.find<Usercont>().Logout(),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: callPage(index),
          )
        ],
      ),
      bottomNavigationBar: DotNavigationBar(
        onTap: (value) {
          index = value;
          setState(() {});
        },
        currentIndex: index,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xff7095b5),
        marginR: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        items: [
          DotNavigationBarItem(icon: Icon(Icons.home)),
          DotNavigationBarItem(icon: Icon(Icons.car_crash)),
          DotNavigationBarItem(icon: Icon(Icons.file_copy)),
          DotNavigationBarItem(icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
