import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.videogame_asset),
      title: Text(
        'Avalia Jogos',
        style: TextStyle(fontSize: 18.0, fontFamily: 'Sans Serif'),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.person_add)),
        SizedBox(
          width: 30.0,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ],
    );
  }

  @override
  //
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
