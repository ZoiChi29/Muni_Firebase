import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:resturent_book/models/user.dart';
import 'package:resturent_book/services/auth_notifier.dart';

class Authntication {
  FirebaseAuth auth = FirebaseAuth.instance;

  void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      gravity: ToastGravity.BOTTOM,
    );
  }

  Future<void> login(
      Users users, AuthNotifier authNotifier, BuildContext context) async {
    UserCredential result;

    try {
      result = await auth.signInWithEmailAndPassword(
          email: users.email, password: users.password);
    } catch (e) {
      toast(e.message.toString());
    }

    //EMAIL VERIFICATION

    try {
      if (result != null) {
        User user = auth.currentUser;
        if (!user.emailVerified) {
          auth.signOut();
          toast("Email Not Verified");
        } else if (user != null) {
          print("Looged In: $user");
          authNotifier.setUser(user);
          await getUserDetails(authNotifier);
          print("done");
        }
      }
    } catch (e) {}
  }

//SIGN UP

  Future<void> signup(
      Users users, AuthNotifier authNotifier, BuildContext context) async {
    UserCredential result;
    bool userDataUploaded = false;

    try {
      result = await auth.createUserWithEmailAndPassword(
          email: users.email, password: users.password);
    } catch (e) {
      toast(e.message.toString());
    }

    try {
      if (result != null) {
        await auth.currentUser.updateProfile(displayName: users.name);

        User user = result.user;
        await user.sendEmailVerification();

        if (user != null) {
          await user.reload();
          print("Sign up: $user");
          uploadUserData(users, userDataUploaded);
          await auth.signOut();
          authNotifier.setUserDetails(null);

          toast("Verfication link has been sent to ${user.email}");
          Navigator.pop(context);
        }
      }
    } catch (e) {
      toast(e.message.toString());
    }
  }

//UPLOAD USER'S DATA TO SERVER
  Future<void> uploadUserData(Users users, bool userDataUploaded) async {
    bool userDataUploadedVar = userDataUploaded;

    User currentUser = auth.currentUser;
    users.id = currentUser.uid;
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("Users");

    //CHECKING FOR THE DATA IS THERE OR NOT

    if (userDataUploadedVar != true) {
      await userRef
          .doc(currentUser.uid)
          .set(users.toMap())
          .catchError((e) => print(e))
          .then((value) => userDataUploadedVar = true);
    }
  }

// USERS DETAILS

  Future<void> getUserDetails(AuthNotifier authNotifier) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(authNotifier.user.uid)
        .get()
        .catchError((e) => print(e))
        .then((value) => (value != null)
            ? authNotifier.setUserDetails(Users.fromMap(value.data()))
            : print(value));
  }

  //LOL WHAT?

  Future<void> initilizeCurrentUser(AuthNotifier authNotifier) async {
    User user = auth.currentUser;

    if (user != null) {
      authNotifier.setUser(user);
      await getUserDetails(authNotifier);
    }
  }

  //SIGN OUT

  Future<void> signOut(AuthNotifier authNotifier, BuildContext context) async {
    await auth.signOut();

    authNotifier.setUser(null);
    print("Log out");
    Navigator.pushNamed(context, "login");
  }
}
