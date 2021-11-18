import 'package:flutter/material.dart';
import 'package:frontend_api/screens/home.dart';
import 'package:frontend_api/screens/login.dart';
import 'package:frontend_api/screens/new_account.dart';
import 'package:frontend_api/widgets/slide_images.dart';
import 'package:google_fonts/google_fonts.dart';


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
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      ),
      home: Home(),
    );
  }
}


