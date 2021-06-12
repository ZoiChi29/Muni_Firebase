import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowProp extends StatefulWidget {
  @override
  _ShowPropState createState() => _ShowPropState();
}

class _ShowPropState extends State<ShowProp> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 12, left: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                child: Theme(
                    data: new ThemeData(
                      primaryColor: Colors.transparent,
                      primaryColorDark: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 05,
                        ),
                        Text(
                          "Your Properties",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              )),
              SizedBox(
                height: 20,
              ),
              new Container(
                height: MediaQuery.of(context).size.height - 167,
                child: new FirebaseAnimatedList(
                    query: FirebaseDatabase.instance
                        .reference()
                        .child("users")
                        .child("properties")
                        .child(auth.currentUser.uid.toString()),
                    padding: new EdgeInsets.only(bottom: 100),
                    //reverse: false,
                    itemBuilder: (_, DataSnapshot snapshot,
                        Animation<double> animation, int x) {
                      return new Column(
                        children: [
                          ShowProperty(snapshot),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ShowProperty(DataSnapshot data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black26,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                /* decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black26,
                    image: DecorationImage(
                        image: NetworkImage(data.value['image'].toString()),
                        fit: BoxFit.cover)
                        ),*/
                height: 90,
              ),
            ),
            flex: 5,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 05, right: 15, top: 04),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 03,
                            ),
                            Text(
                              "Property Name",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.white.withOpacity(.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              data.value['property_name'].toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(.8)),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Property Type",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.white.withOpacity(.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  data.value['property_type'].toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                //I can add here
                              ],
                            ),
                            SizedBox(
                              height: 03,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 13,
                                ),
                                SizedBox(
                                  width: 03,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 01),
                                  child: Text(
                                    data.value['date'].toString(),
                                    style: GoogleFonts.poppins(fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  width: 07,
                                ),
                                booking_builder(data.value['status']),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 01),
                                    child: Text(
                                      data.value['time'].toString(),
                                      maxLines: 3,
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                    ],
                  ),
                )),
            flex: 10,
          )
        ],
      ),
    );
  }

  Widget booking_builder(String status) {
    Color color;

    if (status == 'waiting') {
      color = Colors.orange;
    } else if (status == 'accepted') {
      color = Colors.green;
    } else if (status == 'declined') {
      color = Colors.red;
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(05)), color: color),
      child: Padding(
        padding: const EdgeInsets.only(left: 05, right: 05),
        child: Text(
          status,
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
    );
  }
}
