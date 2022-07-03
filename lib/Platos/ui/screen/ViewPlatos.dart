import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';



class VistaPlatos extends StatefulWidget{

  final int id;
  final String nombre;
  final String precio;
  final int starts;
  final String detalles;

  VistaPlatos({required this.id, required this.nombre, required this.precio,required this.starts,required this.detalles});
  @override
  VistaPlatosState createState() => VistaPlatosState(id:id, nombre:nombre, precio:precio, starts:starts, detalles:detalles);
}
class VistaPlatosState extends State<VistaPlatos>{

  final int id;
  final String nombre;
  final String precio;
  final int starts;
  final String detalles;

  VistaPlatosState({required this.id, required this.nombre,required this.precio,required this.starts,required this.detalles});
  late String numPlato ="";
  @override
  Widget build(BuildContext context) {

    return Card(
      color: ColoresApp.fondoBlanco,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 5,
      child: InkWell(
          onTap: () {
            print("Ver detalles");
          },
          child: Column(
            children: <Widget>[
              ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                  subtitle: Text(
                      'N° 00'+id.toString() +'\n'
                      'N° 00'+nombre.toString() +'\n'
                      'N° 00'+precio.toString() +'\n'
                      'N° 00'+starts.toString() +'\n'
                      'N° 00'+detalles.toString(),
                      style: TextStyle(color: ColoresApp.darkPrimary, fontSize: 10)),
                  leading: Column(children: [
                    Icon(Icons.fastfood_rounded, color: Colors.amber,),
                  ],)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/c1.svg",height: 30, width: 30),
                  SvgPicture.asset("assets/icons/c2.svg",height: 30, width: 30),
                  SvgPicture.asset("assets/icons/c3.svg",height: 30, width: 30),
                  SvgPicture.asset("assets/icons/c4.svg",height: 30, width: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                      onPressed:() => {},
                      child: Text('Reservar',
                          style: TextStyle(color: ColoresApp.darkPrimary))),
                  FlatButton(
                      onPressed: () => {},
                      child: Text('Reportar',
                          style: TextStyle(color: ColoresApp.darkPrimary)))
                ],
              )
            ],
          )),
    );
  }
}