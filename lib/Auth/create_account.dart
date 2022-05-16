import 'package:flutter/material.dart';
import 'package:flutterproject/Auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/Client/home_client.dart';

class CreateAccount extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CreateAccountState();
  }
}

class CreateAccountState extends State<CreateAccount>{

  String email;
  String name;
  String type;
  String pass;

  GlobalKey<FormState> formKey = GlobalKey();

  setEmail(String email){
  this.email = email;
}
  setName(String name){
  this.name = name;
}
  setType(String type){
  this.type = type;
}
  setPassword(String pass){
  this.pass = pass;
}

  saveMyForm() async {
    if(!formKey.currentState.validate()){return;}
     formKey.currentState.save();
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: this.email,
        password: this.pass,
      );

        return HomeClient();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }


    // Navigator.pushReplacement(context, MaterialPageRoute(
    //   builder: (context){
    //     return Login();
    //   }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // name
                  TextFormField(
                    decoration: InputDecoration(labelText: 'name'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'name is empty';
                      }
                    },
                    onSaved: (newValue){
                      setName(newValue);
                    },
                  ),
                  SizedBox(height: 20,), 
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
                      setEmail(newValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  // password
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'password is empty';
                      }else if(value.length < 6){
                        return 'password is short';
                      }
                    },
                    onSaved: (newValue){
                      pass = newValue;
                      setPassword(newValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  // btn create account
                  Container(width: 300,color: Colors.blue,child: FlatButton(
                    onPressed: (){saveMyForm();},
                    child: Text('Create Account',style: TextStyle(color: Colors.white)),)),
                  SizedBox(height: 20,),
                  // go to login
                  InkWell(child: Center(child: Text("you already have account?? Login")),
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context){
                          return Login();
                        }));
                    },)
                ],
              ),
            )),
        ),
    );
  }
}
