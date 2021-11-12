import 'package:frontend_api/models/user_model.dart';

import 'game_model.dart';

class Review {
  final User name;
  final double classification;

  final String comments;
  final Game game;

  const Review({
    required this.name,
    required this.classification,
    required this.comments,
    required this.game,
  });
}
