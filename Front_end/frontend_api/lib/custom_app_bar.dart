
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key,this.scrollOffset = 0.0}) : super(key: key);

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return AppBar(

      leading: Icon(Icons.videogame_asset),
      actions: [
        IconButton(
          icon: const Icon(Icons.person_add),
          tooltip: 'Crie sua conta',
          onPressed: () {},
        ),
        SizedBox(width: 30,),
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'Adicione um jogo',
          onPressed: () {},
        ),
        SizedBox(width: 30,),
      ],
    );
  }
}
