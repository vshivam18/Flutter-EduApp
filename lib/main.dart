import 'package:eduapp/screens/entry_screen.dart';
import 'package:eduapp/screens/registeration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:eduapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:eduapp/screens/home_screen.dart';

void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute : EntryScreen.id,
      routes: {
        EntryScreen.id: (context)=>EntryScreen(),
        HomeScreen.id: (context)=>HomeScreen(),
        RegistrationScreen.id : (context)=>RegistrationScreen(),
        LoginScreen.id: (context)=>LoginScreen(),
      },
    );

  }
}
