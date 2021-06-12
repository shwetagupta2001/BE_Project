import 'package:flutter/material.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';


class Register extends StatefulWidget {
  static String route = 'register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final usernameController = new TextEditingController();
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final locationController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange[700],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "REGISTER",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              icon: Icon(Icons.person)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          controller: usernameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Mobile Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Mobile Number",
                              icon: Icon(Icons.mobile_friendly)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your E-mail id';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Your E-mail id",
                              icon: Icon(Icons.email_outlined)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        width: 380,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              icon: Icon(Icons.lock_outlined)),
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        children: [

                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 5.0),
                            width: 250,
                            child: TextFormField(
                              controller: locationController,
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Pick location from maps",
                                  icon: Icon(Icons.location_on_outlined)),
                            ),
                          ),

                          Container(
                            child: ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Colors.orange[700],
                                child: Text(
                                  'LOCATION',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                      color: Colors.orange[700],
                                      width: 5.0,
                                    )),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        child: ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Colors.orange[700],
                            child: Text(
                              'REGISTER',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, Home.route);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Colors.orange[700],
                                  width: 5.0,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                height: MediaQuery.of(context).size.height * 0.68,
              ),
            ),
          ),
        ],
      ),
    );
  }
}