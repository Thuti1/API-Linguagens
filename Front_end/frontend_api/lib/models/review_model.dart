import 'package:frontend_api/models/user_model.dart';

import 'game_model.dart';


class ReviewModel {
  int id = 0;
  int idName = 0;
  double? rating = 0.0;
  String comment = '';
  int idGame = 0;

  ReviewModel({required this.id, required this.idName, required this.rating, required this.comment, required this.idGame});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idName = json['id_name'];
    rating = json['rating'];
    comment = json['comment'];
    idGame = json['id_game'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_name'] = this.idName;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['id_game'] = this.idGame;
    return data;
  }
}
