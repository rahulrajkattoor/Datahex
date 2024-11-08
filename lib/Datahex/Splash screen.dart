import 'dart:async';


import 'package:datahex/Datahex/login%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Loginpage()) );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: Center(child: Image(image: AssetImage("assets/Layer_1.png"),)),
      ),
    );
  }
}