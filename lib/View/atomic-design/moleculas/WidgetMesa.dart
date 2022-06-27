import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:rustica/View/atomic-design/moleculas/GestorSMS.dart';

class ViewMesa extends StatelessWidget {
  final int id;
  final int num_sillas;
  final String estado;
  final String piso;

  ViewMesa(this.id, this.num_sillas, this.estado, this.piso);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColoresApp.fondoBlanco,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 5,
      child: InkWell(
          onTap: () {
            print("Ir a opcion");
          },
          child: Column(
            children: <Widget>[
              ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                  title: gestionaEstado(estado),
                  subtitle: Text(
                      "Reserve su mesa y en seguida un mozo asignado le atenderá",
                      style: TextStyle(color: ColoresApp.darkPrimary, fontSize: 10)),
                  leading: Column(children: [
                    Icon(Icons.table_bar, color: Colors.amber,),
                    Text('N° 00'+id.toString(), style: TextStyle(color: ColoresApp.fondoNaranja, fontWeight: FontWeight.bold))
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
                      onPressed: () => {
                        siguiendoAtencionOnline
                      },
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
 Timer siguiendoAtencionOnline = Timer.periodic(const Duration(seconds: 20), (timer) {
      GestorSMS();
      print("hola");
  });
  
  Widget gestionaEstado(String estado) {
    Widget widget;
    switch (estado) {
      case "Disponible":
        widget = Row(
          children: [
            const Text("Estado: ",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text(
              estado,
              style: TextStyle(color: Colors.green[900]),
            )
          ],
        );
        break;
      case "Ocupada":
        widget = Row(
          children: [
            const Text("Estado: ",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text(
              estado,
              style: TextStyle(color: Colors.red[900]),
            )
          ],
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }
}
