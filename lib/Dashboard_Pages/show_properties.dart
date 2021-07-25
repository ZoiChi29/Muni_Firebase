import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';


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
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(auth.currentUser.uid.toString())
                  .collection("Properties")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Text("Retriving Data");
                }
                return ListView(
                  children: snapshot.data.docs.map((document) {
                    return Card(
                      margin: EdgeInsets.all(15),
                      child: Container(
                        margin: EdgeInsets.all(1.5),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text("property Name: "),
                            Text(document['property_name'].toString()),
                            SizedBox(height: 10),
                            Text("property Type: "),
                            Text(document['property_type'].toString()),
                            SizedBox(height: 10.0),
                            Text("Location"),
                            Text(document['location'].toString()),
                            SizedBox(height: 10.0),
                            Text("number of bedrooms"),
                            Text(document['number_of_bedrooms'].toString()),
                            SizedBox(height: 10.0),
                            Text("number of livingrooms: "),
                            Text(document['number_of_livingrooms'].toString()),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
        ));
  }
}
