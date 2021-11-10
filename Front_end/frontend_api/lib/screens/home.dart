

import 'package:flutter/material.dart';
import 'package:frontend_api/data/data.dart';
import 'package:frontend_api/widgets/appbar.dart';
import 'package:frontend_api/widgets/game_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.builder(
          itemCount: previews.length,
          itemBuilder: (context,itemIndex){
            return GameCard(featuredGame: previews[itemIndex]);
          },
      ),
    );
  }
}
