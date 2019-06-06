import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Image.asset("assets/splash_bg.png",fit: BoxFit.cover,),
      ),
    );
  }
}