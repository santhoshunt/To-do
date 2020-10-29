import 'package:flutter/material.dart';
import 'package:todo/home.dart';
import 'package:todo/storagefile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(
        storage: Storagefile(),
      ),
    );
  }
}
