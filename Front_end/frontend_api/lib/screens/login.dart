

import 'package:flutter/material.dart';
import 'package:frontend_api/screens/home.dart';
import 'package:frontend_api/screens/new_account.dart';
import 'package:frontend_api/widgets/form_login.dart';

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
            BodyLogin(),
          ],
        )
    );
  }
}

class BodyLogin extends StatelessWidget {
  const BodyLogin({Key? key}) : super(key: key);



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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>NewAccount()),
                    );
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





