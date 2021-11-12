import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_api/models/game_model.dart';
import 'package:frontend_api/widgets/slide_images.dart';

final List<Game> previews = const [
  Game(
    name: 'Free Fire',
    imageUrl:
        'https://s2.glbimg.com/DnMCgsYjQAxoRvGAeWDe07DbzzE=/0x0:700x394/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/S/o/6GtGaOSBenKdAiSRLBrQ/free-fire-max-banner.jpg',
    description: 'Battle Royal para celular!',
  ),
  Game(
    name: 'God of war',
    imageUrl:
        'https://blog.br.playstation.com/tachyon/sites/4/2021/09/God-of-War-Ragnarok-Featured-image.jpg',
    description: 'Um deus grego em um universo nórdico',
  ),
  Game(
    name: 'Call of Duty Vanguard',
    imageUrl:
        'https://meups.com.br/wp-content/uploads/2021/11/Call-of-Duty-Vanguard-3-900x503.jpg',
    description: 'A serie COD em seu apíce!',
  ),
];

final List<Widget> sliders = [
  SlideHeader(game: previews[0]),
  SlideHeader(game: previews[1]),
  SlideHeader(game: previews[2]),
];
