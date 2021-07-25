import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:Muni_APP/models/user.dart';
import 'package:Muni_APP/services/auth_notifier.dart';
import 'package:Muni_APP/services/authntication.dart';
import 'package:Muni_APP/services/firebase.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  Users _users = new Users();

  final GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool radio = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emiratesidController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.reference();

  bool _success;
  String _userEmail;
  String _password;
  String _fullname;

  Authntication _authntication = new Authntication();
  //INIT STATE

  @override
  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    //INITILIZE CURRENT USER
    _authntication.initilizeCurrentUser(authNotifier);
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  void _submitForm() {
    if (!formkey.currentState.validate()) {
      return;
    }
    formkey.currentState.save();
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    print("Success");
    _authntication.signup(_users, authNotifier, context);
  }

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return SafeArea(
      child: Scaffold(
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
                                    controller: _fullnameController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Full Name';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.name,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Enter your name",
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
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Email';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Enter e-mail",
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
                                    controller: _emiratesidController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Your Emirates ID';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Enter your Emirates ID",
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
                                    controller: _dobController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your Date of Birth';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.datetime,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Enter your date of birth",
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
                                    controller: _mobileController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your Mobile Number';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Enter your mobile number",
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
                                    controller: _phoneController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Phone Number';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Enter your phone number",
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
                                    obscureText: true,
                                    controller: _passwordController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Password';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: "Enter password",
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
                                        if (formkey.currentState.validate()) {
                                          //onLoading(context);

                                          try {
                                            final user = (await _auth
                                                    .createUserWithEmailAndPassword(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            ))
                                                .user;
                                            userSignUp(
                                              user.uid,
                                              user.email,
                                              _fullnameController.text,
                                              _emiratesidController.text,
                                              _dobController.text,
                                              _mobileController.text,
                                              _phoneController.text,
                                            );
                                            _responsehandle(
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
                                          }
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
