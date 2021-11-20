

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_api/data/data.dart';
import 'package:frontend_api/http/api_manager.dart';
import 'package:frontend_api/models/game_model.dart';
import 'package:frontend_api/models/review_model.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/widgets/appbar.dart';
import 'package:frontend_api/widgets/form.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key, required this.currentGame}) : super(key: key);
  final GameModel currentGame;

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState(currentGame);
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List<ReviewModel> reviews = [];

  GameModel currentGame;
  _ReviewsScreenState(this.currentGame);

  _getReviews() {
    API_Manager.getReview().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        reviews = list.map((model) => ReviewModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getReviews();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: ReviewAppBar(currentGame),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, itemIndex){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(" ${reviews[itemIndex].idName} - ${reviews[itemIndex].idGame}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),

              ),
              leading: Icon(Icons.person,color: Colors.white,),
              subtitle: Text("${reviews[itemIndex].comment}",
                style: TextStyle(
                  color: Colors.white,
                ) ,),
              trailing: Text("${reviews[itemIndex].rating}",style:
              TextStyle(fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,)),
            ),
          );
        },
      ),
    );
  }
}

