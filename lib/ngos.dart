import 'package:flutter/material.dart';
import 'package:be_project/register.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:be_project/constants.dart';
import 'package:be_project/profile.dart';

class Ngos extends StatefulWidget {
  static String route = 'ngos';

  @override
  _NgosState createState() => _NgosState();
}

class _NgosState extends State<Ngos> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          title: Text("AVSHESH"),
        ),

      body: Center(
        child: Column(
          children: [
            Container(
              width:350,
              height: 150,
              child: Card(
                shadowColor: Colors.orange[700],
                elevation: 4.0,
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child:Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
                          child: Icon(Icons.perm_identity),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 8.0,
                    // ),
                    Expanded(
                      flex: 3,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child: ListTile(
                                title: Text('ABC organization'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child:ListTile(
                                leading: IconButton(
                                  icon: Icon(Icons.location_on, color: Colors.orange[700],),
                                ),
                                title: Text('Mumbai, Maharashtra'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListTile(
                                leading: IconButton(
                                  icon: Icon(Icons.phone, color: Colors.orange[700],),
                                ),
                                title: Text('1234567890'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child:ListTile(
                                leading: IconButton(
                                  icon: Icon(Icons.mail, color: Colors.orange[700],),
                                ),
                                title: Text('abc@gmail.com'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width:350,
              height: 150,
              child: Card(
                shadowColor: Colors.orange[700],
                elevation: 4.0,
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child:Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
                          child: Icon(Icons.perm_identity),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 8.0,
                    // ),
                    Expanded(
                      flex: 3,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child: ListTile(
                                title: Text('ABC organization'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child:ListTile(
                                leading: IconButton(
                                  icon: Icon(Icons.location_on, color: Colors.orange[700],),
                                ),
                                title: Text('Mumbai, Maharashtra'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListTile(
                                leading: IconButton(
                                  icon: Icon(Icons.phone, color: Colors.orange[700],),
                                ),
                                title: Text('1234567890'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child:ListTile(
                                leading: IconButton(
                                  icon: Icon(Icons.mail, color: Colors.orange[700],),
                                ),
                                title: Text('abc@gmail.com'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ),

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
