import 'package:flutter/material.dart';
import 'package:frontend_api/data/data.dart';
import 'package:frontend_api/models/user_model.dart';
import 'package:frontend_api/widgets/appbar.dart';
import 'package:frontend_api/widgets/form.dart';
import 'package:frontend_api/widgets/slide_images.dart';

class Home extends StatelessWidget {

  final User currentUser;
  Home(this.currentUser);

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var smallScreenGrid = currentWidth > 1201;


    return Scaffold(
      appBar: HomeAppBar(username: currentUser.name,),
      body: ListView(
        children: [Stack(
          alignment: Alignment.topLeft,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SlideImages(),

                ],
              ),
            ),
          ],
        ),]
      ),
    );
  }
}
