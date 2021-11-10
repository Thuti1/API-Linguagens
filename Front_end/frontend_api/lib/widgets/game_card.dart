

import 'package:flutter/material.dart';
import 'package:frontend_api/models/game_model.dart';

class GameCard extends StatelessWidget {
  const GameCard({Key? key,required this.featuredGame}) : super(key: key);
  final Game featuredGame;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(featuredGame.name,
        style:TextStyle(
         fontWeight: FontWeight.bold,
         color: Colors.white
        ),
      ),
      leading: Image.network(featuredGame.imageUrl),
      subtitle: Text(featuredGame.description,
        style:TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white
        ),),
    );
  }
}
