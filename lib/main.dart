import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resturent_book/User_Pages/Login.dart';
import 'package:resturent_book/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EASA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      onGenerateRoute: generateRoute,
    );
  }
}
