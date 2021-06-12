import 'package:be_project/ngos.dart';
import 'package:be_project/profile.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:be_project/register.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          Register.route: (context) => Register(),
          Home.route: (context) =>Home(),
          Addproduct.route: (context) =>Addproduct(),
          Ngos.route: (context) =>Ngos(),
          Profile.route: (context) =>Profile(),
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Position _currentPosition;
  String _currentAddress;
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();


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
                        "LOGIN",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 10.0),
                        child: TextFormField(
                          controller: usernameController,
                          keyboardType: TextInputType.phone,
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
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 10.0),
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
                              icon: Icon(Icons.lock)),
                        ),
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
                              'LOGIN',
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
                    ),

                    Center(child: Text("Don't have an account?"),),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please ",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          Container(
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
                                  Navigator.pushNamed(context, Register.route);
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

                    if (_currentAddress != null) Text(
                        _currentAddress
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
  _getCurrentLocation() {
    print("here2");
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      print("here4");
      setState(() {
        print("here3");
        _currentPosition = position;
        print(_currentPosition);
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

}
