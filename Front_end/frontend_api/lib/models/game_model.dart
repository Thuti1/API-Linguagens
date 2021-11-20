 import 'package:flutter/material.dart';
 import 'dart:convert';

GameModel newsModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String newsModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel {
  int id = 0;
  String name = '';
  String desc = '';
  String image = '';

  GameModel(
      {required this.id, required this.name, required this.desc, required this.image});


  GameModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['image'] = this.image;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'image': image
    };
  }
}

