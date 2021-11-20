import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_api/data/data.dart';
import 'package:frontend_api/http/api_manager.dart';
import 'package:frontend_api/models/game_model.dart';
import 'package:frontend_api/models/review_model.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/screens/home.dart';
import 'package:frontend_api/screens/login.dart';
import 'package:frontend_api/screens/new_review.dart';
import 'package:frontend_api/screens/reviews.dart';
import 'package:frontend_api/widgets/textbox.dart';



class FormLogin extends StatelessWidget {

  
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();

  GameModel currentGame;
  FormLogin(this.currentGame);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextCustomBox(emailController, 'Coloque seu email'),
        SizedBox(height: 30,),
        TextCustomBox(userController, 'Coloque seu usuario'),
        SizedBox(height: 40,),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]
          ), child: ElevatedButton(
          onPressed: () {
            final UserModel _currentUser = UserModel(id: 0, name: userController.text, email: emailController.text);
            //if(!users.contains(currentUser)) {users.add(currentUser);print("User adicionado");}
            showNewReviewPage(context);
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )), child: Container(
          width: double.infinity,
          height: 50,
          child: Center(child: Text('Entrar')),
        ),),
        )
      ],
    );

  }
  void showNewReviewPage(BuildContext context) {
    final UserModel currentUser = UserModel(id: 0, name: userController.text, email: emailController.text);
    //if(!users.contains(currentUser)) {users.add(currentUser);print("User adicionado");}
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewReview(currentUser: currentUser,currentGame: currentGame,)),
    );

  }
  
}

class FormNewAccount extends StatelessWidget {
  


  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextCustomBox(emailController, 'Email que deseja cadastrar'),
        SizedBox(height: 30,),
        TextCustomBox(userController, 'Crie seu usuario'),
        SizedBox(height: 40,),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]
          ), child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )), child: Container(
          width: double.infinity,
          height: 50,
          child: Center(child: Text('Criar')),
        ),),
        )
      ],
    );
  }
  
}

class FormReview extends StatelessWidget {


  UserModel currentUser;
  GameModel currentGame;
  FormReview(this.currentUser, this.currentGame);

  final classificationController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberCustomBox(classificationController,'De sua nota de 0 - 5'),
        SizedBox(height: 30,),
        TextCustomBox(descriptionController, 'Comente algo..'),
        SizedBox(height: 40,),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]
          ), child: ElevatedButton(
          onPressed: () {showReviewsPage(context);},
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )), child: Container(
          width: double.infinity,
          height: 50,
          child: Center(child: Text('Publicar')),
        ),),
        )
      ],
    );
  }
  void showReviewsPage(BuildContext context) {
    ReviewModel currentReview = ReviewModel(
        id: 0,
        idName:0,//currentUser.text,
       rating: double.tryParse(classificationController.text),
        comment: descriptionController.text,
        idGame: 0);//currentGame.text);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewsScreen(currentGame: currentGame,)),
    );
  }




}

class FormNewGame extends StatelessWidget {
  TextEditingController gameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextCustomBox(gameController, 'Nome do jogo'),
        SizedBox(height: 30,),
        TextCustomBox(descriptionController, 'Descricao do Jogo'),
        SizedBox(height: 30,),
        TextCustomBox(urlController, 'Icone do jogo(url)'),
        SizedBox(height: 40,),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]
          ), child: ElevatedButton(
          onPressed: () {
            showHomePage(context);
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )), child: Container(
          width: double.infinity,
          height: 50,
          child: Center(child: Text('Adicionar')),
        ),),
        )
      ],
    );
  }
  void showHomePage(BuildContext context){
    Map<GameModel,dynamic> toMap(){
      GameModel currentGame;
      return {

      };
    }
    GameModel currentGame = GameModel(
        id: 0,
        name: gameController.text,
        desc: descriptionController.text,
        image: urlController.text);

     API_Manager.postGame(currentGame.toMap());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
}

