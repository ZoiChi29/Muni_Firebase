import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resturent_book/firebase.dart';

import '../firebase.dart';

class Prop_Reg extends StatefulWidget {
  @override
  _Prop_RegState createState() => _Prop_RegState();
}

class _Prop_RegState extends State<Prop_Reg> {
  final formkey = new GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // TextField Controllers
  final TextEditingController permitNo = TextEditingController();
  final TextEditingController propName = TextEditingController();
  final TextEditingController propType = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController yearofCon = TextEditingController();
  final TextEditingController people = TextEditingController();
  final TextEditingController floors = TextEditingController();
  final TextEditingController livingrooms = TextEditingController();
  final TextEditingController bedrooms = TextEditingController();
  final TextEditingController bathrooms = TextEditingController();
  final TextEditingController kitchens = TextEditingController();
  final TextEditingController exteriors = TextEditingController();

  //the keys
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final databaseReference = FirebaseDatabase.instance.reference();

  //entered values, might not need them
  String propname;
  String proptype;
  String _location;
  String _area;
  String year_of_con;
  String _people;
  String _floors;
  String _livingrooms;
  String _bedrooms;
  String _bathrooms;
  String _kitchens;
  String _exteriors;
  String _permitNo;

  @override
  initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Property Regestration"),
        ),
        key: _scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(16.0)),
                  Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: Form(
                              key: formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Please Fill the Following Details",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: propName,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter the property name';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Property Name",
                                        labelStyle: GoogleFonts.poppins(
                                          // fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: propType,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter the property type';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Enter the property type",
                                        labelStyle: GoogleFonts.poppins(
                                          //  fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: location,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter The Location';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Location",
                                        labelStyle: GoogleFonts.poppins(
                                          // fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: area,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter The Area';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Area",
                                        labelStyle: GoogleFonts.poppins(
                                          // fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: yearofCon,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter The Year of Construction';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Year of Construction",
                                        labelStyle: GoogleFonts.poppins(
                                          // fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: permitNo,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter the property Permit Number';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Permit Number",
                                        labelStyle: GoogleFonts.poppins(
                                          // fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: people,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter The Number of People';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Number of People",
                                        labelStyle: GoogleFonts.poppins(
                                          // fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: floors,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Number of Floors';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Number of Floors",
                                        labelStyle: GoogleFonts.poppins(
                                          //fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: livingrooms,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Number of Living Rooms';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Number of Living Rooms",
                                        labelStyle: GoogleFonts.poppins(
                                          //fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: bedrooms,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Number of Bedrooms';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Number of Bedrooms",
                                        labelStyle: GoogleFonts.poppins(
                                          //fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: bathrooms,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Number of Bathrooms';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Number of Bathrooms",
                                        labelStyle: GoogleFonts.poppins(
                                          //fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: kitchens,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Number of Kitchens';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Number of Kitchens",
                                        labelStyle: GoogleFonts.poppins(
                                          //fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: exteriors,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Number of Exteriors';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Number of Exteriors",
                                        labelStyle: GoogleFonts.poppins(
                                          //fontFamily: "OpenSansBold",
                                          color: Colors.white,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side:
                                              BorderSide(color: Colors.white)),
                                      onPressed: () async {
                                        {
                                          propSignUp(
                                              //id.text,
                                              permitNo.text,
                                              propName.text,
                                              propType.text,
                                              location.text,
                                              area.text,
                                              yearofCon.text,
                                              people.text,
                                              floors.text,
                                              livingrooms.text,
                                              bedrooms.text,
                                              bathrooms.text,
                                              kitchens.text,
                                              exteriors.text);
                                          Navigator.pushNamed(
                                              context, "dashboard");

                                          /*_responsehandle(
                                                user,
                                                message(
                                                    "Sign Up Completed",
                                                    Icons.check_circle_outline,
                                                    Colors.green));
                                          } catch (error) {
                                            print(error.code);
                                            switch (error.code) {
                                              case 'email-already-in-use':
                                                _responsehandle(
                                                    null,
                                                    message(
                                                        "Duplicate Email",
                                                        Icons.cancel,
                                                        Colors.red));
                                                break;
                                              case 'network-request-failed':
                                                _responsehandle(
                                                    null,
                                                    message(
                                                        "No Network Connection",
                                                        Icons.network_check,
                                                        Colors.orange));
                                                break;
                                              case 'invalid-email':
                                                _responsehandle(
                                                    null,
                                                    message(
                                                        "Invalid Email",
                                                        Icons.alternate_email,
                                                        Colors.red));
                                                break;
                                            }
                                          }*/
                                        }
                                      },
                                      textColor: Colors.black87,
                                      color: Colors.white,
                                      child: Text("Register",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              /*decoration: new BoxDecoration(
                color: Colors.black,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: new AssetImage("assets/ap.jpg"),
                ),
              ),*/
            ),
          ),
        ),
      ),
    );
  }

  Widget _responsehandle(var user, Widget response) {
    Navigator.pop(context);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            Navigator.pop(context);

            return null;
          },
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Dialog(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: response,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget message(String message, IconData icon, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Icon(
          icon,
          color: color,
          size: 50,
        ),
        SizedBox(
          height: 20,
        ),
        new Text(
          message,
          style: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
