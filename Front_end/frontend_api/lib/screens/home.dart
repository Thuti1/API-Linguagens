import 'package:flutter/material.dart';
import 'package:frontend_api/data/data.dart';
import 'package:frontend_api/widgets/appbar.dart';
import 'package:frontend_api/widgets/slide_images.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var smallScreenGrid = currentWidth > 1201;

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SlideImages(
                    currentGame: previews[0],
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        top: smallScreenGrid ? 70.0 : 40.0,
                        bottom: smallScreenGrid ? 70.0 : 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: smallScreenGrid ? 2.0 : 1.0,
                          width: smallScreenGrid ? 150.0 : 80.0,
                          color: Colors.black,
                        ),
                        Container(
                          height: smallScreenGrid ? 2.0 : 1.0,
                          width: smallScreenGrid ? 150.0 : 80.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
