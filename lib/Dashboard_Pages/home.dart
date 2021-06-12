import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Home Page"),
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
                                      Navigator.pushNamed(context, "Prop_Reg");
                                    },
                                    color: Colors.white,
                                    textColor: Colors.black87,
                                    child: Text("Register A Property",
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
                                      Navigator.pushNamed(context, "ShowProp");
                                    },
                                    color: Colors.white,
                                    textColor: Colors.black87,
                                    child: Text("View Properties",
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
