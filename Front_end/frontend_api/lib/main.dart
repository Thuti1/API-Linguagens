import 'package:flutter/material.dart';
import 'package:frontend_api/screens/home.dart';


void main() {
  runApp(AvaliaApp());
}

class AvaliaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avalia App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Home(),
    );
  }
}


