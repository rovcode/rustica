import 'package:flutter/material.dart';
import 'package:rustica/Widgets/Resources/moleculas/barra_navegacion.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
class WidgetApi extends StatefulWidget{
  @override
  WidgetApiState createState() => WidgetApiState();
}
class WidgetApiState extends State<WidgetApi>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
         backgroundColor: ColoresApp.fondoBlanco ,
         appBar: AppBar(
           backgroundColor: ColoresApp.darkPrimary,
           title: Text("API EN CONSTRUCCIÓN")
           ),
         body:
         Column(
           children: [
             Text("API: https://jsonplaceholder.typicode.com/", style: TextStyle(color: ColoresApp.darkPrimary, fontWeight: FontWeight.bold),),
             Text("Haga esta consula: https://jsonplaceholder.typicode.com/photos/180", style: TextStyle(color: ColoresApp.darkPrimary),)
             
         ], crossAxisAlignment: CrossAxisAlignment.center,));
    
  }
}