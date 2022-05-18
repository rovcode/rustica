import 'package:flutter/material.dart';

class Registro extends StatefulWidget{
 @override
  RegistroState createState() => RegistroState();
}

class RegistroState extends State<Registro>{
   @override
   Widget build(BuildContext context){
     return  Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ));
  }
}