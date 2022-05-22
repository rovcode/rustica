import 'package:flutter/material.dart';
import 'package:rustica/ui/atomic-design/tokens/ColoresApp.dart';

class Principal extends StatefulWidget{
  @override
  PrincipalState createState() => PrincipalState();
}

class PrincipalState extends State<Principal>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hola desde principal', style: TextStyle(color: ColoresApp.darkPrimary),),
    );
  }
}