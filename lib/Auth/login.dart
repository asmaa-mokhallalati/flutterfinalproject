import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterproject/Auth/create_account.dart';
import 'package:flutterproject/Client/home_client.dart';
import 'package:flutterproject/Merchant/add_product.dart';
import 'package:flutterproject/Merchant/home_merchant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>{
  User user;
  String email;
  String pass;

  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  saveMyForm() async {
    log('data: clickkk');
    if(!formKey.currentState.validate()){return;}
    formKey.currentState.save();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass
      );
      if(!credential.user.email.isEmpty){
        return HomeClient();
      }
      log('data: $credential');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // email
                  TextFormField(
                    decoration: InputDecoration(labelText: 'email'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'email is empty';
                      }else if(!RegExp('[A-Za-z0-9._%-]+@[A-Za-z0-9._%-]+\.[A-Za-z]{2,4}').hasMatch(value)){
                        return 'Enter right email';
                      }
                    },
                    onSaved: (newValue){
                      email = newValue;
                    },
                  ),
                  SizedBox(height: 20,),
                  // password
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'password'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'password is empty';
                      }
                    },
                    onSaved: (newValue){
                      pass = newValue;
                    },
                  ),
                  SizedBox(height: 100,),
                  // btn login
                  Container(width: 300,color: Colors.blue,child: FlatButton(
                    onPressed: (){
                      log('data: clickkkedd');
                      //return AddProduct();
                      return saveMyForm();
                      },
                    child: Text('Login',style: TextStyle(color: Colors.white)),),),
                  SizedBox(height: 20,),
                  // go to create account
                  InkWell(child: Center(child: Text("you havent account?? Create Account")),
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context){
                          return CreateAccount();
                        }));
                    },)
                ],
              ),
            )),
        ),
      
    );
  }
}
