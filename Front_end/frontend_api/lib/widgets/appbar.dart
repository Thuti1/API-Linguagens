import 'package:flutter/material.dart';
import 'package:frontend_api/screens/new_account.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

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
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewAccount()),
              );
            },tooltip: 'Crie uma nova conta',
            icon: Icon(Icons.person_add)),
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
