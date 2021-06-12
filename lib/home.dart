import 'package:be_project/addproduct.dart';
import 'package:be_project/ngos.dart';
import 'package:be_project/profile.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:be_project/constants.dart';

class Home extends StatefulWidget {
  static String route = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;


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
              height: 220,
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
                          child: Image.network('https://picsum.photos/250?image=9'),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 8.0,
                    // ),
                    Expanded(
                      flex:2,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 200,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue,),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: ListTile(
                                title: Text('LOCATION\n''Mumbai, Maharashtra', style: TextStyle(fontSize: 14),),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: ListTile(
                                title: Text('STUBBLE\n''Wheat', style: TextStyle(fontSize: 14),),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child:ListTile(
                                title: Text('QUANTITY\n''20 kg', style: TextStyle(fontSize: 14),),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child:ListTile(
                                title: Text('PRICE\n''100 per kg', style: TextStyle(fontSize: 14),),
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
              height: 220,
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
                          child: Image.network('https://picsum.photos/250?image=9'),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 8.0,
                    // ),
                    Expanded(
                      flex:2,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 200,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue,),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: ListTile(
                                title: Text('LOCATION\n''Mumbai, Maharashtra', style: TextStyle(fontSize: 14),),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: ListTile(
                                title: Text('STUBBLE\n''Wheat', style: TextStyle(fontSize: 14),),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child:ListTile(
                                title: Text('QUANTITY\n''20 kg', style: TextStyle(fontSize: 14),),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child:ListTile(
                                title: Text('PRICE\n''100 per kg', style: TextStyle(fontSize: 14),),
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
        ),
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







