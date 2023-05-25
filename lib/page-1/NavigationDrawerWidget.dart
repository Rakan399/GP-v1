import 'package:flutter/material.dart';
import 'package:myapp/page-1/Home.dart';
import 'package:myapp/page-1/My_Car.dart';
import 'package:myapp/page-1/My_Report.dart';
import 'package:myapp/page-1/Welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/page-1/images/auto-group-8j9x.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff7095b5),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (_) => Home()))
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Reports'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => My_Report()))
            },
          ),
          ListTile(
            leading: Icon(Icons.car_crash),
            title: Text('My Cars'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => My_Car()))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(),
          SizedBox(
            height: 220,
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            // onTap: () => Get.f,
          ),
        ],
      ),
    );
  }
}
