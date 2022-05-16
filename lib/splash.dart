import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/Auth/login.dart';
import 'package:flutterproject/Client/home_client.dart';


class Splach extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2)).then((value) {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeClient();
        }));
      }
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Icon(Icons.ice_skating_sharp),
      ),
    );
  }
}
