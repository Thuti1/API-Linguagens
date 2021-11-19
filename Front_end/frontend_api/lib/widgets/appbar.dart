import 'package:flutter/material.dart';
import 'package:frontend_api/models/game_model.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/screens/login.dart';
import 'package:frontend_api/screens/new_account.dart';
import 'package:frontend_api/screens/new_game.dart';
import 'package:frontend_api/screens/new_review.dart';
import 'package:frontend_api/widgets/form.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      leading: Icon(Icons.videogame_asset),
      title: Text(
        'Avalia Jogos',
        style: TextStyle(fontSize: 18.0, fontFamily: 'Sans Serif'),
      ),
      actions: [

        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewGame()),
          );
        }, icon: Icon(Icons.add),tooltip: 'Adicione um novo jogo',),
        SizedBox(width: 40,),
      ],

    );
  }

  @override
  //
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class ReviewAppBar extends StatelessWidget with PreferredSizeWidget {

  Game currentGame;
  ReviewAppBar(this.currentGame);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },tooltip: 'Crie uma nova review',
          icon: Icon(Icons.arrow_back)),
      title: Text(
        'Reviews',
        style: TextStyle(fontSize: 18.0, fontFamily: 'Sans Serif'),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login(currentGame)),
              );
            },tooltip: 'Crie uma nova review',
            icon: Icon(Icons.reviews)),
        SizedBox(
          width: 30.0,
        ),
        SizedBox(width: 30,),
      ],
    );
  }

  @override
  //
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
