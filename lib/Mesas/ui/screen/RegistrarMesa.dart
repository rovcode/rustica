// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RegistrarMesa extends StatefulWidget{
  const RegistrarMesa({Key? key}) : super(key: key);

  @override
  RegistrarMesaState createState() => RegistrarMesaState();
}
class RegistrarMesaState extends State<RegistrarMesa>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
       title: const Text("Registrar Mesa"),
    ) ,
    body: Container() ,
    );
  }
}