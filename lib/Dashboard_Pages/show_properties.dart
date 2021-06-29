import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:resturent_book/firebase.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

/*class Data {
  String area, location, year_of_construction;
  Data(this.area, this.location, this.year_of_construction);
}*/

class ShowProp extends StatefulWidget {
  @override
  _ShowPropState createState() => _ShowPropState();
}

class _ShowPropState extends State<ShowProp> {
  final dbRef = FirebaseDatabase.instance.reference().child("properties");
  List<Map<dynamic, dynamic>> lists = [];
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Properties"),
        ),
        body: new Container(
            height: MediaQuery.of(context).size.height - 160,
            child: new FirebaseAnimatedList(
                query: FirebaseDatabase.instance
                    .reference()
                    .child("users")
                    .child(auth.currentUser.uid.toString())
                    .child("properties"),
                //.orderByChild('userid')
                //.equalTo(auth.currentUser.uid[0].toString())
                //.orderByChild("area"),
                //.startAt(auth.currentUser.uid.toString())
                //.endAt(auth.currentUser.uid.toString() + "\uf8ff"),
                itemBuilder: (_, DataSnapshot snapshot,
                    Animation<double> animation, int x) {
                  return CardUI(snapshot);
                })));
  }

  Widget CardUI(DataSnapshot data) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.all(1.5),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(data.value['area'].toString()),
            SizedBox(height: 10.0),
            Text(data.value['userid'].toString()),
            SizedBox(height: 10.0),
            Text(data.value['name'].toString()),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
