import 'package:flutter/material.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/screens/login.dart';
import 'package:frontend_api/screens/new_account.dart';
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

      ],
    );
  }

  @override
  //
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class ReviewAppBar extends StatelessWidget with PreferredSizeWidget {






  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      leading: Icon(Icons.grade),
      title: Text(
        'Reviews',
        style: TextStyle(fontSize: 18.0, fontFamily: 'Sans Serif'),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
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
