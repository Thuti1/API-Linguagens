import 'package:flutter/material.dart';
import 'package:frontend_api/constants/constants.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/screens/home.dart';
import 'package:frontend_api/screens/new_account.dart';
import 'package:frontend_api/widgets/form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                .of(context)
                .size
                .width / 4),
            children: [
              BodyLogin(),
            ],
          ),
        )
    );
  }
}

class BodyLogin extends StatelessWidget {


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
                   _showNewAccount(context);
                  },),
              ],),
              SizedBox(height: 30,),
              Image.network(
                logoLogin,
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
  void _showNewAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewAccount()),
    );
  }
}





