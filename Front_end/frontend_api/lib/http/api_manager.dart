import 'dart:convert';

import 'package:frontend_api/models/game_model.dart';
import 'package:http/http.dart' as http;

class API_Manager {

  static Future getGame() async {
    return http.get(Uri.http("localhost:8080", "/Jogos"),);
  }
  static Future getReview() async {
    return http.get(Uri.http("localhost:8080", "/Reviews"));
  }
  static Future<http.Response> postGame(Map <String,dynamic> currentGame) async {
    var url = Uri.http("localhost:8080", "/Jogos");
    var body = jsonEncode(currentGame);
    var response = await http.post(url,headers: {"Content-Type": "application/json", "Access-Control-Allow-Origin" : "*" },body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;

  }
}