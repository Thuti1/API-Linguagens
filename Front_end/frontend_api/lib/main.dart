import 'package:flutter/material.dart';

import 'home.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Home(),
    );
  }
}


