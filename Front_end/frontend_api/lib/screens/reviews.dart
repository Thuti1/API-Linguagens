


import 'package:flutter/material.dart';
import 'package:frontend_api/data/data.dart';
import 'package:frontend_api/models/game_model.dart';
import 'package:frontend_api/models/review_model.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/widgets/appbar.dart';
import 'package:frontend_api/widgets/form.dart';

class ReviewsScreen extends StatefulWidget {
  //const ReviewsScreen({Key? key}) : super(key: key);


  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: ReviewAppBar(),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, itemIndex){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(" ${reviews[itemIndex].name} - ${reviews[itemIndex].game.name}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                ),

              ),
              leading: Icon(Icons.person,color: Colors.white,),
              subtitle: Text("${reviews[itemIndex].comments}",
                style: TextStyle(
                  color: Colors.white,
                ) ,),
              trailing: Text("${reviews[itemIndex].classification}",style:
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

