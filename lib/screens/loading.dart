import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rac/screens/utilities/constants.dart';
//import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Widget build(BuildContext context,) {
    
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF5969c9),
                        Color(0xFF3040a3),
                      ]
            )
          ),
          child: Center(
            child: Image(
              width: 300,
              height: 300,
              image: AssetImage(
                'assets/anim/logo-loading.gif'
              )

            ),
          ),
        ),
      );
      
  }
}
