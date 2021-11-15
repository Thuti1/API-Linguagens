import 'dart:ui';

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend_api/data/data.dart';
import 'package:frontend_api/models/game_model.dart';
import 'package:frontend_api/screens/home.dart';
import 'package:frontend_api/screens/reviews.dart';

class SlideImages extends StatefulWidget {
  SlideImages({Key? key,required this.currentGame}) : super(key: key);
  Game currentGame;
  @override
  _SlideImagesState createState() => _SlideImagesState();
}

class _SlideImagesState extends State<SlideImages> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: sliders,
          ),
        ],
      ),
    );
  }
}
class SlideHeader extends StatelessWidget {
  const SlideHeader({Key? key, required this.currentGame}) : super(key: key);
  final Game currentGame;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Stack(
        children: <Widget>[
          Opacity(child: Image.network(currentGame.imageUrl, fit: BoxFit.cover, width: 1000.0,),opacity: 0.80,),
          Positioned(
            bottom: 300.0,
            left: 150.0,
            right: 150.0,
            child: Column(
              children: [
                Text(
                  currentGame.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.all(18.0),
                      ),
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewsScreen()),
                      );},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, top: 0.0, right: 30.0, bottom: 0.0),
                        child: Text(
                          'Review',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



