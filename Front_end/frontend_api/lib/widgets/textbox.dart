

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberCustomBox extends StatelessWidget {


  final TextEditingController exampleController;
  final String hintText;

  NumberCustomBox(this.exampleController, this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: exampleController,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        labelStyle: TextStyle(fontSize: 12,),
        contentPadding: EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class TextCustomBox extends StatelessWidget {


  final TextEditingController exampleController;
  final String hintText;


  TextCustomBox(this.exampleController, this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: exampleController,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        labelStyle: TextStyle(fontSize: 12,),
        contentPadding: EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
