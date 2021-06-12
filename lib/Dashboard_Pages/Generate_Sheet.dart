import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class GenSheet extends StatefulWidget {
  @override
  _GenSheetState createState() => _GenSheetState();
}

class _GenSheetState extends State<GenSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Generate a Sheet"),
            ),
            body: Center(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                                child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 270,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.white)),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "LivingRoom");
                                    },
                                    color: Colors.white,
                                    textColor: Colors.black87,
                                    child: Text(
                                        "Generate Sheet for Living Room",
                                        style:
                                            GoogleFonts.poppins(fontSize: 14)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 270,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.white)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "Bedroom");
                                    },
                                    color: Colors.white,
                                    textColor: Colors.black87,
                                    child: Text("Generate Sheet for Bedroom",
                                        style:
                                            GoogleFonts.poppins(fontSize: 14)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 270,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.white)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "Bathroom");
                                    },
                                    color: Colors.white,
                                    textColor: Colors.black87,
                                    child: Text("Generate Sheet for Bathroom",
                                        style:
                                            GoogleFonts.poppins(fontSize: 14)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 270,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.white)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "Kitchen");
                                    },
                                    color: Colors.white,
                                    textColor: Colors.black87,
                                    child: Text("Generate Sheet for Kitchen",
                                        style:
                                            GoogleFonts.poppins(fontSize: 14)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 270,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.white)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "Exterior");
                                    },
                                    color: Colors.white,
                                    textColor: Colors.black87,
                                    child: Text("Generate Sheet for Exterior",
                                        style:
                                            GoogleFonts.poppins(fontSize: 14)),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ])))));
  }
}
