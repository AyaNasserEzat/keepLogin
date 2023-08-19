import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:keeplogin/screens/screen2.dart';
import 'package:keeplogin/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String? name;
  String? password;
  sharedPref pref=sharedPref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FlutterLogo(
              size: 90,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (data) {
                setState(() {
                  name = data;
                });
              },
              decoration: InputDecoration(
                hintText: 'username',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (data) {
                setState(() {
                  password = data;
                });
              },
              decoration: InputDecoration(
                hintText: 'password',
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async{
                pref.save('password', password);
                pref.save('name', name);
        // print(await pref.load('name'));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
return screen2();
                }));
              },
              child: Text('login'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            Text('forget password?')
          ]),
        ),
      ),
    );
  }
}