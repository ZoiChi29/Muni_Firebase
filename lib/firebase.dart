import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Firebase_Helper {
  final databaseReference = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void insert_user_info(String id, String mail, String fullname,
      String emiratesid, String dob, String mobile, String phone) {
    databaseReference.child("users").child(id).set({
      'userid': id,
      'name': fullname,
      'mail': mail,
      'emirates_id': emiratesid,
      'date of birth': dob,
      'mobile': mobile,
      'phone': phone,
    });
  }

  void insert_users_property(
      //String id,
      String propname,
      String proptype,
      String _location,
      String _area,
      String year_of_con,
      String _people,
      String _floors,
      String _livingrooms,
      String _bedrooms,
      String _bathrooms,
      String _kitchens,
      String _exteriors) {
    databaseReference
        .child("users")
        .child(auth.currentUser.uid.toString())
        .child("properties")
        .set({
      //'property_id': id,
      'property_name': propname,
      'property_type': proptype,
      'location': _location,
      'area': _area,
      'year_of_construction': year_of_con,
      'number_of_people': _people,
      'number_of_floors': _floors,
      'number_of_livingrooms': _livingrooms,
      'number_of_bedrooms': _bedrooms,
      'number_of_bathrooms': _bathrooms,
      'number_of_kitchens': _kitchens,
      'number_of_exteriors': _exteriors,
      "user_id": auth.currentUser.uid
    });
  }

  void Living_Room(
    String q1,
    String q2,
    String q3,
    String q4,
    String q5,
    String q6,
    String q7,
    String q8,
    String q9,
    String q10,
    String q11,
    String q12,
  ) {
    databaseReference
        .child("users")
        .child(auth.currentUser.uid.toString())
        .child("properties")
        .child("Sheets")
        .child("Living_Room")
        .set({
      'Question 1': q1,
      'Question 2': q2,
      'Question 3': q3,
      'Question 4': q4,
      'Question 5': q5,
      'Question 6': q6,
      'Question 7': q7,
      'Question 8': q8,
      'Question 9': q9,
      'Question 10': q10,
      'Question 11': q11,
      'Question 12': q12,
      "user_id": auth.currentUser.uid,
    });
  }

  void Bed_Room(
    String q1,
    String q2,
    String q3,
    String q4,
    String q5,
    String q6,
    String q7,
    String q8,
    String q9,
    String q10,
    String q11,
    String q12,
  ) {
    databaseReference
        .child("users")
        .child(auth.currentUser.uid.toString())
        .child("properties")
        .child("Sheets")
        .child("Bedroom")
        .set({
      'Question 1': q1,
      'Question 2': q2,
      'Question 3': q3,
      'Question 4': q4,
      'Question 5': q5,
      'Question 6': q6,
      'Question 7': q7,
      'Question 8': q8,
      'Question 9': q9,
      'Question 10': q10,
      'Question 11': q11,
      'Question 12': q12,
      "user_id": auth.currentUser.uid,
    });
  }

  void Bath_Room(
    String q1,
    String q2,
    String q3,
    String q4,
    String q5,
    String q6,
    String q7,
  ) {
    databaseReference
        .child("users")
        .child(auth.currentUser.uid.toString())
        .child("properties")
        .child("Sheets")
        .child("Bathroom")
        .set({
      'Question 1': q1,
      'Question 2': q2,
      'Question 3': q3,
      'Question 4': q4,
      'Question 5': q5,
      'Question 6': q6,
      'Question 7': q7,
      "user_id": auth.currentUser.uid,
    });
  }

  void Kitchen_(
    String q1,
    String q2,
    String q3,
    String q4,
    String q5,
    String q6,
    String q7,
    String q8,
    String q9,
    String q10,
    String q11,
    String q12,
  ) {
    databaseReference
        .child("users")
        .child(auth.currentUser.uid.toString())
        .child("properties")
        .child("Sheets")
        .child("Kitchen")
        .set({
      'Question 1': q1,
      'Question 2': q2,
      'Question 3': q3,
      'Question 4': q4,
      'Question 5': q5,
      'Question 6': q6,
      'Question 7': q7,
      'Question 8': q8,
      'Question 9': q9,
      'Question 10': q10,
      'Question 11': q11,
      'Question 12': q12,
      "user_id": auth.currentUser.uid,
    });
  }

  void Exterior_(
    String q1,
    String q2,
    String q3,
    String q4,
    String q5,
    String q6,
    String q7,
    String q8,
    String q9,
    String q10,
    String q11,

  ) {
    databaseReference
        .child("users")
        .child(auth.currentUser.uid.toString())
        .child("properties")
        .child("Sheets")
        .child("Exterior")
        .set({
      'Question 1': q1,
      'Question 2': q2,
      'Question 3': q3,
      'Question 4': q4,
      'Question 5': q5,
      'Question 6': q6,
      'Question 7': q7,
      'Question 8': q8,
      'Question 9': q9,
      'Question 10': q10,
      'Question 11': q11,

      "user_id": auth.currentUser.uid,
    });
  }

  /*Future<void> create_booking(String res_id, String res_name, String date, String clock,
      String people, String time, String image) async {
    String key = databaseReference.child("bookings").push().key.toUpperCase();
    String result;



    /*databaseReference
        .child("Properties")
        .child(userid)
        .child("booked_dates")
        .child(date)
        .child(time)
        .set('booked');*/

    databaseReference
        .child("bookings")
        .child(auth.currentUser.uid.toString())
        .child(key)
        .set({
      'shop_id': res_id,
      'shop_name': res_name,
      'date': date,
      'time': clock,
      'people': people,
      'time': time,
      'image': image,
      'booking_id': key,
      'status': 'waiting',
      'user_id': auth.currentUser.uid
    });



  }*/

  /* Future<String> check_status(String res_id, String res_name, String date, String clock,
      String people, String time, String image) async {
    String result;
    await databaseReference.child('shops').child(res_id)
        .child("booked_dates")
        .child(date)
        .child(time).once().
    then((snapshot){
      if(snapshot.value==null){
        result='notbooked';
      }
      else{
        result='booked';
      }
    });
    return result;
  }*/

  /*Future<String> reset_booking_status(String date,String uid) async {
    String result='ds';
    await databaseReference.child('shops').child(uid)
        .child("booked_dates")
        .child(date)
        .remove();

    return result;
  }

  void remove_booking(String bookingid) {
    databaseReference
        .child("bookings")
        .child(auth.currentUser.uid)
        .child(bookingid)
        .remove();
  }

  void update_stuats(String bookingid, String status, String uid) {
    databaseReference
        .child("bookings")
        .child(uid)
        .child(bookingid)
        .child('status')
        .set(status);
  }

  void insert_shop_info(
      String image, String fullname, String user, String limit) {
    databaseReference.child("shops").child(user).set({
      'id': user,
      'image': image,
      'name': fullname,
      'reviews': "234",
      'limit': limit
    });
  }*/
}
