import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_api/data/data.dart';
import 'package:frontend_api/http/api_manager.dart';
import 'package:frontend_api/models/game_model.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/screens/reviews.dart';
import 'package:frontend_api/widgets/appbar.dart';
import 'package:frontend_api/widgets/form.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<GameModel> games = [];

  _getGames() {
    API_Manager.getGame().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        games = list.map((model) => GameModel.fromJson(model)).toList();
      });
    });
  }


  initState() {
    super.initState();
    _getGames();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: Container(
          child: ListView.builder(
            itemCount: games.length, //snapshot.data.
            itemBuilder: (context, itemIndex) {
              return Container(
                height: 100,
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          GameModel currentGame = games[itemIndex];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewsScreen(
                                      currentGame: currentGame,
                                    )),
                          );
                        },
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              games[itemIndex].image,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            games[itemIndex].name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            games[itemIndex].desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}