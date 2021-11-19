

import 'package:flutter/material.dart';
import 'package:frontend_api/constants/constants.dart';
import 'package:frontend_api/models/game_model.dart';
import 'package:frontend_api/widgets/form.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .width / 6),
          child:
            BodyGames(),

        )
    );
  }
}

class BodyGames extends StatelessWidget {
  const BodyGames({Key? key,}) : super(key: key);




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
              Text('Adicione um \nnovo Jogo!',
                style: TextStyle(fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
              SizedBox(height: 30,),
              Text('Se você não tem um jogo para adicionar',
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
                logoGame,
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
            child:FormNewGame(),
          ),),
      ],
    );
  }
}
