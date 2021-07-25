import 'package:flutter/material.dart';
import 'package:Muni_APP/App_Pages/dashboard.dart';
import 'package:Muni_APP/Dashboard_Pages/Generate_Sheet.dart';
import 'package:Muni_APP/Dashboard_Pages/Property_Registration.dart';
import 'package:Muni_APP/Dashboard_Pages/show_properties.dart';
import 'package:Muni_APP/Sheets_Pages/Bathroom.dart';
import 'package:Muni_APP/Sheets_Pages/BedRoom.dart';
import 'package:Muni_APP/Sheets_Pages/Exterior.dart';
import 'package:Muni_APP/Sheets_Pages/Kitchen.dart';
import 'package:Muni_APP/Sheets_Pages/Living_Room.dart';
import 'package:Muni_APP/User_Pages/Login.dart';
import 'package:Muni_APP/User_Pages/Register.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var signuparg = settings.arguments;

  switch (settings.name) {
    case 'register':
      return MaterialPageRoute(builder: (context) => Register());

    case 'login':
      return MaterialPageRoute(builder: (context) => Login());

    case 'dashboard':
      return MaterialPageRoute(builder: (context) => Dashbaord());

    case 'Prop_Reg':
      return MaterialPageRoute(builder: (context) => Prop_Reg());

    case 'ShowProp':
      return MaterialPageRoute(builder: (context) => ShowProp());

    case 'Sheets':
      return MaterialPageRoute(builder: (context) => GenSheet());

    case 'LivingRoom':
      return MaterialPageRoute(builder: (context) => livingRoom());

    case 'Bedroom':
      return MaterialPageRoute(builder: (context) => BedRoom());

    case 'Bathroom':
      return MaterialPageRoute(builder: (context) => Bathroom());

    case 'Kitchen':
      return MaterialPageRoute(builder: (context) => Kitchen());

    case 'Exterior':
      return MaterialPageRoute(builder: (context) => Exterior());

    /*case 'shop_bookings':
      return MaterialPageRoute(builder: (context) => Shop_Bookings_List());

    case 'shop_inforamtion':
      return MaterialPageRoute(builder: (context) => Shop_Information());*/
  }
}
