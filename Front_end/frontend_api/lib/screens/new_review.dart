
import 'package:flutter/material.dart';
import 'package:frontend_api/constants/constants.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/screens/home.dart';
import 'package:frontend_api/widgets/form.dart';
import 'package:frontend_api/widgets/slide_images.dart';

class NewReview extends StatelessWidget {
  // const NewReview({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .width / 6),
          children: [
            BodyReview(),
          ],
        )
    );
  }
}

class BodyReview extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nos de \nSua opnião!',
                style: TextStyle(fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
              SizedBox(height: 30,),
              Text('Se você não tem nada a dizer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10,),
              Row(children: [
                Text('Você pode', style: TextStyle(
                  color: Colors.white,),),
                SizedBox(width: 15,),
                GestureDetector(
                  child: Text('Voltar ao menu', style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.pop(context);
                  },),
              ],),
              SizedBox(height: 30,),
              Image.network(
                logoReview,
                width: 150,),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery
              .of(context)
              .size
              .height / 6),
          child: Container(
            width: 320,
            child:FormReview(),
          ),),
      ],
    );
  }
}
