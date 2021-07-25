import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:Muni_APP/services/firebase.dart';

import '../services/firebase.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Exterior extends StatefulWidget {
  @override
  _ExteriorState createState() => _ExteriorState();
}

class _ExteriorState extends State<Exterior> {
  final _formkey = new GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  File _image;
  final picker = ImagePicker();
  final listofChoices = ["Yes", "No"];
  String dropdownValue1 = "Yes";
  String dropdownValue2 = "Yes";
  String dropdownValue3 = "Yes";
  String dropdownValue4 = "Yes";
  String dropdownValue5 = "Yes";
  String dropdownValue6 = "Yes";

/*//image fun
  File _image;
  final picker = ImagePicker();

  Future chooseImage() async {
    PickedFile pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {});
  }*/

// TextField Controllers
  TextEditingController question1 = TextEditingController();
  TextEditingController question2 = TextEditingController();
  TextEditingController question3 = TextEditingController();
  TextEditingController question4 = TextEditingController();
  TextEditingController question5 = TextEditingController();
  TextEditingController question6 = TextEditingController();
  TextEditingController question7 = TextEditingController();
  TextEditingController question8 = TextEditingController();
  TextEditingController question9 = TextEditingController();
  TextEditingController question10 = TextEditingController();
  TextEditingController question11 = TextEditingController();

//the keys
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final databaseReference = FirebaseDatabase.instance.reference();

//entered values, might not need them
  String q1;
  String q2;
  String q3;
  String q4;
  String q5;
  String q6;
  String q7;
  String q8;
  String q9;
  String q10;
  String q11;

//from here we are setting the online DB.
  @override
  void initState() {
    //super.initState();
    question1 = new TextEditingController();
    question2 = new TextEditingController();
    question3 = new TextEditingController();
    question4 = new TextEditingController();
    question5 = new TextEditingController();
    question6 = new TextEditingController();
    question7 = new TextEditingController();
    question8 = new TextEditingController();
    question9 = new TextEditingController();
    question10 = new TextEditingController();
    question11 = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text("Exterior Sheet"),
            ),
            backgroundColor: Colors.blueGrey,
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
                                          child: Form(
                                              key: _formkey,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Please Fill the Following Details",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    TextFormField(
                                                      controller: question1,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask Owner to show you outdoor AC units",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                // fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    /*TextFormField(
                                                      controller: question2,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask Owner to show you lighting fixtures",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //  fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),*/
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child:
                                                          DropdownButtonFormField(
                                                        value: dropdownValue1,
                                                        icon: Icon(Icons
                                                            .arrow_downward),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              "Ask Owner to show you lighting fixtures",
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        items: listofChoices
                                                            .map(
                                                                (String value) {
                                                          return new DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child:
                                                                new Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (String newValue) {
                                                          setState(() {
                                                            dropdownValue1 =
                                                                newValue;
                                                          });
                                                        },
                                                        validator:
                                                            (dynamic value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Select an answer';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    /*TextFormField(
                                                      controller: question3,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner if they have information regarding the light fixtures wattage",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),*/
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child:
                                                          DropdownButtonFormField(
                                                        value: dropdownValue2,
                                                        icon: Icon(Icons
                                                            .arrow_downward),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              "Ask owner if they have information regarding the light fixtures wattage",
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        items: listofChoices
                                                            .map(
                                                                (String value) {
                                                          return new DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child:
                                                                new Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (String newValue) {
                                                          setState(() {
                                                            dropdownValue2 =
                                                                newValue;
                                                          });
                                                        },
                                                        validator:
                                                            (dynamic value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Select an answer';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      controller: question4,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner if they have information regarding the light fixtures wattage",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                fontSize: 13,
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    /*TextFormField(
                                                      controller: question5,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner if there are any sensors installed",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),*/
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child:
                                                          DropdownButtonFormField(
                                                        value: dropdownValue3,
                                                        icon: Icon(Icons
                                                            .arrow_downward),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              "Ask owner if there are any sensors installed",
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        items: listofChoices
                                                            .map(
                                                                (String value) {
                                                          return new DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child:
                                                                new Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (String newValue) {
                                                          setState(() {
                                                            dropdownValue3 =
                                                                newValue;
                                                          });
                                                        },
                                                        validator:
                                                            (dynamic value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Select an answer';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    /*TextFormField(
                                                      controller: question6,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner to show you irrigation system if any",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),*/
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child:
                                                          DropdownButtonFormField(
                                                        value: dropdownValue4,
                                                        icon: Icon(Icons
                                                            .arrow_downward),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              "Ask owner to show you irrigation system if any",
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        items: listofChoices
                                                            .map(
                                                                (String value) {
                                                          return new DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child:
                                                                new Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (String newValue) {
                                                          setState(() {
                                                            dropdownValue4 =
                                                                newValue;
                                                          });
                                                        },
                                                        validator:
                                                            (dynamic value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Select an answer';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    /*TextFormField(
                                                      controller: question7,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner to show you water pumps if any",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),*/
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child:
                                                          DropdownButtonFormField(
                                                        value: dropdownValue5,
                                                        icon: Icon(Icons
                                                            .arrow_downward),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              "Ask owner to show you water pumps if any",
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        items: listofChoices
                                                            .map(
                                                                (String value) {
                                                          return new DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child:
                                                                new Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (String newValue) {
                                                          setState(() {
                                                            dropdownValue5 =
                                                                newValue;
                                                          });
                                                        },
                                                        validator:
                                                            (dynamic value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Select an answer';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    /*TextFormField(
                                                      controller: question8,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner to show you exterior envelope",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),*/
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child:
                                                          DropdownButtonFormField(
                                                        value: dropdownValue6,
                                                        icon: Icon(Icons
                                                            .arrow_downward),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              "Ask owner to show you exterior envelope",
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        items: listofChoices
                                                            .map(
                                                                (String value) {
                                                          return new DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child:
                                                                new Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (String newValue) {
                                                          setState(() {
                                                            dropdownValue6 =
                                                                newValue;
                                                          });
                                                        },
                                                        validator:
                                                            (dynamic value) {
                                                          if (value.isEmpty) {
                                                            return 'Please Select an answer';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      controller: question9,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner if there is a swimming pool",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      controller: question10,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner to show you all electrical devices",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      controller: question11,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          new InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              labelText:
                                                                  "Ask owner to show you the roof",
                                                              labelStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                //fontFamily: "OpenSansBold",
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                                //  when the TextFormField in unfocused
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green),
                                                                //  when the TextFormField in focused
                                                              ),
                                                              border:
                                                                  UnderlineInputBorder()),
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageExt()),
                                                    SizedBox(height: 20),
                                                    RaisedButton(
                                                      child: Text(
                                                        "Submit Sheet",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      color: Colors.blue,
                                                      onPressed: () {
                                                        Exterior_sheet_firestore(
                                                          question1.text,
                                                          dropdownValue1,
                                                          dropdownValue2,
                                                          question4.text,
                                                          dropdownValue3,
                                                          dropdownValue4,
                                                          dropdownValue5,
                                                          dropdownValue6,
                                                          question9.text,
                                                          question10.text,
                                                          question11.text,
                                                        );
                                                        Navigator.pushNamed(
                                                            context,
                                                            "dashboard");
                                                      },
                                                      /*onPressed: () async {
                                                          {
                                                            Firebase_Helper
                                                                helper =
                                                                new Firebase_Helper();
                                                            helper.Exterior_(
                                                              question1.text,
                                                              question2.text,
                                                              question3.text,
                                                              question4.text,
                                                              question5.text,
                                                              question6.text,
                                                              question7.text,
                                                              question8.text,
                                                              question9.text,
                                                              question10.text,
                                                              question11.text,
                                                            );
                                                            Navigator.pushNamed(
                                                                context,
                                                                "dashboard");
                                                          }
                                                        }*/
                                                    ),
                                                  ])))))
                            ]))))));
  }
}
