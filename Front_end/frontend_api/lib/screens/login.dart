

import 'package:flutter/material.dart';
import 'package:frontend_api/screens/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .width / 4),
          children: [
            Body(),
          ],
        )
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Logue em \nAvalia Jogos!',
                style: TextStyle(fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
              SizedBox(height: 30,),
              Text('Se você não possui uma conta',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10,),
              Row(children: [
                Text('Você pode', style: TextStyle(
                  color: Colors.white,),),
                SizedBox(width: 15,),
                GestureDetector(
                  child: Text('Registrar-se', style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold),),
                  onTap: () {
                    print(MediaQuery
                        .of(context)
                        .size
                        .width);
                  },),
              ],),
              SizedBox(height: 30,),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Video-Game-Controller-Icon-IDV-green.svg/1024px-Video-Game-Controller-Icon-IDV-green.svg.png',
                width: 150,),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery
              .of(context)
              .size
              .height / 6),
          child: Container(
            width: 320,
            child: FormLogin(),
          ),),
      ],
    );
  }
}


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


