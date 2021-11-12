import 'package:flutter/material.dart';
import 'package:frontend_api/screens/login.dart';
import 'package:frontend_api/widgets/form_login.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .width / 6),
          children: [
            BodyAccount(),
          ],
        )
    );
  }
}

class BodyAccount extends StatelessWidget {
  const BodyAccount({Key? key}) : super(key: key);

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
              Text('Crie sua \nConta conosco!',
                style: TextStyle(fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
              SizedBox(height: 30,),
              Text('Se você ja possui uma conta',
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
                  child: Text('Voltar ao menu', style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.pop(context);
                  },),
              ],),
              SizedBox(height: 30,),
              Image.network(
                'https://www.ala.org/lita/sites/ala.org.lita/files/content/learning/webinars/gamelogo.png',
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


