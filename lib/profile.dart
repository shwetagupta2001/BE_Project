import 'package:flutter/material.dart';
import 'package:be_project/register.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:be_project/constants.dart';
import 'package:be_project/ngos.dart';

class Profile extends StatefulWidget {
  static String route = 'profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          title: Text("AVSHESH"),
        ),

      body: Center(child: Text('this is profile page')),
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.transparent,
            selectedItemBackgroundColor: Colors.green,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            showSelectedItemShadow: false,
            barHeight: 70,
          ),

          selectedIndex: selectedIndex,

          onSelectTab: (index){
            setState(() {
              selectedIndex = index;
              if (selectedIndex == 0) {
                Navigator.pushNamed(context, Home.route);
              } else if (selectedIndex == 1) {
                Navigator.pushNamed(context, Addproduct.route);
              } else if (selectedIndex == 2) {
                Navigator.pushNamed(context, Ngos.route);
              } else if (selectedIndex == 3) {
                Navigator.pushNamed(context, Profile.route);
              }
            });
          },

          items: items,
        )
    );
  }
}
