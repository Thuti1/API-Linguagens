import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_api/data/data.dart';
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
            final User _currentUser = User(name: userController.text, email: emailController.text);
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
    final User currentUser = User(name: userController.text, email: emailController.text);
    //if(!users.contains(currentUser)) {users.add(currentUser);print("User adicionado");}
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewReview(currentUser: currentUser,)),
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


  User currentUser;
  Game currentGame;
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
    Review currentReview = Review(
        name:currentUser.name,
        classification: double.tryParse(classificationController.text),
        comments: descriptionController.text,
        game: currentGame);
   if(!reviews.contains(currentUser)) {reviews.add(currentReview);print("Review adicionada");}
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewsScreen()),
    );
  }




}
