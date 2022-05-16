import 'package:flutter/material.dart';
import 'package:flutterproject/Auth/login.dart';
import 'add_product.dart';
import 'show_orders.dart';

class HomeMerchant extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeMerchantState();
  }
}

class HomeMerchantState extends State<HomeMerchant> {
 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.exit_to_app , color: Colors.white,),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context){
                return Login();
                }
              ));
          })
        ],),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50,),
              // btn add product
                Container(width: 300,color: Colors.blue,child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return AddProduct();
                      }));
                  },
                  child: Text('Add Product',style: TextStyle(color: Colors.white)),)),
                SizedBox(height: 100,),
                // btn my Orders
                Container(width: 300,color: Colors.blue,child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return ShowOrders();
                      }));
                  },
                  child: Text('My Ordres',style: TextStyle(color: Colors.white)),)),
            ],
          ),
        ),
      ),
    );
  }
}
