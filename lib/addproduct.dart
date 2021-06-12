import 'package:flutter/material.dart';
import 'dropdown_data.dart';

class Addproduct extends StatefulWidget {
  static String route = 'addproduct';
  @override
  _AddproductState createState() => _AddproductState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddproductState extends State<Addproduct> {
  int selectedIndex = 1;

  String selectedStubble = 'TYPE OF STUBBLE';
  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < stubbleList.length; i++) {
      String stubble = stubbleList[i];

      var newItem = DropdownMenuItem(
        child: Text(stubble),
        value: stubble,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  String selectedWeight = 'WEIGHT';
  List<DropdownMenuItem> getWeightItems() {
    List<DropdownMenuItem<String>> weightItems = [];

    for (int i = 0; i < weightList.length; i++) {
      String weight = weightList[i];

      var newItem2 = DropdownMenuItem(
        child: Text(weight),
        value: weight,
      );
      weightItems.add(newItem2);
    }
    return weightItems;
  }

  String selectedPrice = 'PER UNIT';
  List<DropdownMenuItem> getPriceItems() {
    List<DropdownMenuItem<String>> priceItems = [];

    for (int i = 0; i < priceList.length; i++) {
      String price = priceList[i];

      var newItem3 = DropdownMenuItem(
        child: Text(price),
        value: price,
      );
      priceItems.add(newItem3);
    }
    return priceItems;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.teal,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //add product label
                      Center(
                        child: Text(
                          "ADD PRODUCT",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),

                      //stubble type dropdown
                      Center(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(100.0, 10.0, 80.0, 0.0),
                          child: DropdownButton<String>(
                              value: selectedStubble,
                              items: getDropdownItems(),
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              onChanged: (value) {
                                setState(() {
                                  selectedStubble = value;
                                });
                              }),
                        ),
                      ),
                      //quantity, price, add button

                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'QUANTITY',
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(100.0, 0.0, 80.0, 0.0),
                        child: DropdownButton<String>(
                            value: selectedWeight,
                            items: getWeightItems(),
                            isExpanded: true,
                            style:
                            TextStyle(color: Colors.black, fontSize: 20.0),
                            onChanged: (value) {
                              setState(() {
                                selectedWeight = value;
                              });
                            }),
                      ),

                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'PRICE',
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(100.0, 0.0, 80.0, 0.0),
                        child: DropdownButton<String>(
                            value: selectedPrice,
                            items: getPriceItems(),
                            isExpanded: true,
                            style:
                            TextStyle(color: Colors.black, fontSize: 20.0),
                            onChanged: (value) {
                              setState(() {
                                selectedPrice = value;
                              });
                            }),
                      ),

                      Center(
                        child: Container(
                          child: ButtonTheme(
                            minWidth: 100.0,
                            height: 50.0,
                            child: RaisedButton(
                              color: Colors.teal,
                              child: Text(
                                'ADD',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    color: Colors.teal,
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
      ),
    );
  }
}
