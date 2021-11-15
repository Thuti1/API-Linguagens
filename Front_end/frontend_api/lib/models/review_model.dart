import 'package:frontend_api/models/user_model.dart';

import 'game_model.dart';

class Review {
  final String name;
  final double classification;
  final String comments;
  final Game game;

  const Review({
    required this.name,
    required this.classification,
    required this.comments,
    required this.game,
  });

  @override
  String toString() {
    return 'Review{name: $name, classification: $classification, comments: $comments, game: $game}';
  }
}
