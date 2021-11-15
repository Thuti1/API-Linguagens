import 'package:flutter/material.dart';

class Game {
  final String name;
  final String imageUrl;
  final String description;

  const Game({
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  @override
  String toString() {
    return 'Game{name: $name, imageUrl: $imageUrl, description: $description}';
  }
}
