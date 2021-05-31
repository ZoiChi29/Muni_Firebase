import 'package:flutter/material.dart';
import 'package:resturent_book/App_Pages/dashboard.dart';
import 'package:resturent_book/User_Pages/Login.dart';
import 'package:resturent_book/User_Pages/Register.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var signuparg = settings.arguments;

  switch (settings.name) {
    case 'register':
      return MaterialPageRoute(builder: (context) => Register());

    case 'login':
      return MaterialPageRoute(builder: (context) => Login());

     case 'dashboard':
      return MaterialPageRoute(builder: (context) => Dashbaord());

    /*case 'booking':
      return MaterialPageRoute(builder: (context) => book(signuparg));

    case 'shop_manager':
      return MaterialPageRoute(builder: (context) => Shop_Getting_Started());

    case 'shop_login':
      return MaterialPageRoute(builder: (context) => Login_Shop());

    case 'shop_signup':
      return MaterialPageRoute(builder: (context) => SignUp_Shop());

    case 'shop_bookings':
      return MaterialPageRoute(builder: (context) => Shop_Bookings_List());

    case 'shop_inforamtion':
      return MaterialPageRoute(builder: (context) => Shop_Information());*/
  }
}
