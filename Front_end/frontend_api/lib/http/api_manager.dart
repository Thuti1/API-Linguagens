// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// class API_Manager {
//   Future<UsersModel> getUser() async {
//     var client = http.Client();
//     var usersModels = null;
//
//     try {
//       var response = await client.get(Uri.http(
//           'localhost:8080/ip do pc', 'oq vem depois da /(de conexao)'));
//
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         //dps disso aqui ele foi no https://app.quicktype.io/ e botou o Json de saida pra cirar o model
//         var jsonMap = jsonDecode(jsonString);
//
//         usersModel = UsersModel.fromJson(jsonMap);
//       }
//     }
//     catch(Exception){
//       return usersModels;
//     }
//     return usersModels;
//   }
// }