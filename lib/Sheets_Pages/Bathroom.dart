import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:resturent_book/services/firebase.dart';

import '../services/firebase.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Bathroom extends StatefulWidget {
  @override
  _BathroomState createState() => _BathroomState();
}

class _BathroomState extends State<Bathroom> {
  final _formkey = new GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  File _image;
  final picker = ImagePicker();
  final listofChoices = ["Yes", "No"];
  String dropdownValue1 = "Yes";
  String dropdownValue2 = "Yes";
  String dropdownValue3 = "Yes";

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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text("Bathroom Sheet"),
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
                                                                  "Ask Owner to show you exhaust fans and portable AC units",
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
                                                            uploadImageBathroom()),
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
                                                              "Ask owner to show you interior and exterior envelope",
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
                                                            uploadImageBathroom()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
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
                                                            uploadImageBathroom()),
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
                                                    ),
                                                    IconButton(
                                                        icon:
                                                            Icon(Icons.camera),
                                                        onPressed: () =>
                                                            uploadImageBathroom()),
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
                                                                  "Ask owner to show you water flow devices",
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
                                                              "Ask owner to show you water flow devices",
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
                                                            uploadImageBathroom()),
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
                                                                  "Ask owner to show you the windows",
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
                                                              "Ask owner to show you the windows",
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
                                                            uploadImageBathroom()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
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
                                                            uploadImageBathroom()),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    RaisedButton(
                                                      child: Text(
                                                        "Submit Sheet",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      color: Colors.blue,
                                                      onPressed: () {
                                                        Bathroom_sheet_firestore(
                                                            question1.text,
                                                            dropdownValue1,
                                                            question3.text,
                                                            question4.text,
                                                            dropdownValue2,
                                                            dropdownValue3,
                                                            question7.text);

                                                        Navigator.pushNamed(
                                                            context,
                                                            "dashboard");
                                                      },
                                                      /*onPressed: () async {
                                                          {
                                                            Firebase_Helper
                                                                helper =
                                                                new Firebase_Helper();
                                                            helper.Bath_Room(
                                                              question1.text,
                                                              question2.text,
                                                              question3.text,
                                                              question4.text,
                                                              question5.text,
                                                              question6.text,
                                                              question7.text,
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
