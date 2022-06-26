import 'package:flutter/material.dart';
import 'package:rustica/Model/Mesa.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/atomic-design/moleculas/menu_vertical.dart';
class PantallaMesas extends StatefulWidget{
   List data=[];
   PantallaMesas({ required this.data});
   @override
   PantallaMesasState createState() => PantallaMesasState(data:data);
  
}
class PantallaMesasState extends State<PantallaMesas> {
  List data=[];
  
  PantallaMesasState({ required this.data});
  @override
    @override
     Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: ColoresApp.fondoBlanco,
           appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart,
                  color: ColoresApp.fondoBlanco,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        backgroundColor: ColoresApp.fondoNaranja,
        elevation: 0.0,
        actions: [
          IconButton(
              color: ColoresApp.fondoBlanco,
              icon: Icon(Icons.notifications),
              onPressed: () {
               
              }),
        ],
      ),
        body: fun(),
        );
  }
  fun(){
      // for (int i = 0; i < data.length; i++) {
      //   for (int j = 0; j <data.length;j++){
      //              print(data[i]);
      //   }            
      // }
       print(data.toString());
  }
}