import 'package:flutter/material.dart';
import 'package:keeplogin/screens/hompage.dart';
import 'package:keeplogin/screens/screen2.dart';
import 'package:keeplogin/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
   sharedPref pref=sharedPref();
   
       
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home://homePage(),
      pref.load('name')==null? homePage():screen2(),
    );
  }
}