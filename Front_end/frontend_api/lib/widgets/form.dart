import 'package:flutter/material.dart';
import 'package:frontend_api/screens/home.dart';

class FormLogin extends StatelessWidget {
  //const formLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Coloque seu email',
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
        ),
        SizedBox(height: 30,),
        TextField(
          decoration: InputDecoration(
            hintText: 'Coloque seu Usúario',
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
        ),
        SizedBox(height: 40,),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]
          ), child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )), child: Container(
          width: double.infinity,
          height: 50,
          child: Center(child: Text('Logar')),
        ),),
        )
      ],
    );
  }
}

class FormReview extends StatelessWidget {
  const FormReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Sua nota de 0 - 5',
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
        ),
        SizedBox(height: 30,),
        TextField(
          decoration: InputDecoration(
            hintText: 'Comente',
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
        ),
        SizedBox(height: 40,),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]
          ), child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )), child: Container(
          width: double.infinity,
          height: 50,
          child: Center(child: Text('Publicar')),
        ),),
        )
      ],
    );
  }
}
