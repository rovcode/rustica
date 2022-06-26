import 'dart:convert';

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
            child: Text(""),
          ));
    }
    @override
  void initState() {
    super.initState();
    listamesas();
  }

Future<void> listamesas() async {      
      ServiceMesas _serviceMesas = ServiceMesas();
      dynamic res = await _serviceMesas.getMesas();
      
       //print(res);
      if (res.statusCode == 200) {
          late List datmesas=[];
             
               String estado,piso;
              for (var i = 0; i < res.data.length; i++) {
                           
                           datmesas.add(res.data[i]['id']);
                           print(jsonEncode(res));
              }
            
              //Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaMesas(data:datmesas))); 
            
                                
      } else {
        print("error");
      }
    }
  
  

} 


