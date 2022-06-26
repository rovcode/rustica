import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rustica/Model/Mesa.dart';
import 'package:rustica/Model/db/ServiceMesas.dart';
import 'package:rustica/View/Usuario/PantallaMesas.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';

class MesasUsuario extends StatefulWidget {
  @override
  MesasUsuarioState createState() => MesasUsuarioState();
}
class MesasUsuarioState extends State<MesasUsuario>{

     
      
  @override
     Widget build(BuildContext context) {;
        return Scaffold(
          backgroundColor: ColoresApp.fondoBlanco,
          body:Container(
            child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30)),
                          color: ColoresApp.lightPrimary,
                          onPressed:(){
                             print(listamesas());
                          },
                          child: Text('Admin Web',
                              style: TextStyle(
                                color: ColoresApp.darkPrimary,
                              )),
                        ),
          ));
    }
  //   @override
  // void initState() {
  //   super.initState();
  //   listamesas();
  // }

Future<Response> listamesas() async {      
      ServiceMesas _serviceMesas = ServiceMesas();
      dynamic res = await _serviceMesas.getMesas();
        return res;
      // print(res);
      // if (res.statusCode == 200) {
      //     late List datmesas=[];             
          
      //       return Container(
      //         margin: EdgeInsets.all(50),
      //         child: Text("Holassssssssssssssss", style: TextStyle(color: ColoresApp.fondoNegro),),
      //       );
      //       //Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaMesas(data:res))); 
            
                                
      // } else {
      //   print("error");
      // }
    }
  
  

} 


