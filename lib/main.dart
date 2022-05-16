import 'package:firebase_core/firebase_core.dart';
import 'package:flutterproject/splash.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      home: Splach()));

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('hiiiiiii'),),
    );
  }
}