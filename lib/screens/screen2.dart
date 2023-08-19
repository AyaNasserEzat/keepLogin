import 'package:flutter/material.dart';
import 'package:keeplogin/screens/hompage.dart';
import 'package:keeplogin/sharedpref.dart';

class screen2 extends StatefulWidget {
  screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  sharedPref pref = sharedPref();
  String? loadName='';
  void getName()async{
    try{
    String n=await pref.load('name');
  setState(() {
    loadName=n;
  });
    }catch(e){}
  }

  @override
  void initState(){
    getName();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text('My App'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(
                size: 60,
              ),
              backgroundColor: Colors.white,
            ),
            accountEmail: Text(''),
            accountName: Text(loadName!),
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('Fragment 1'),
          ),
          ListTile(
           leading: Icon(Icons.movie),
            title: Text('Fragment 2'),
          ),
          ListTile(
            leading:IconButton(onPressed: ()async{
              print(loadName);
        
           String? n=  await pref.clear('name');
            
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return homePage();
            }));
            
            }, icon: Icon(Icons.logout), ),
            
            title: Text(' logout'),
          
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(loadName!),
          ],
        ),
      ),
    );
  }
}