import 'package:flutter/material.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';

class MesasUsuario extends StatefulWidget {
  @override
  MesasUsuarioState createState() => MesasUsuarioState();
}
class MesasUsuarioState extends State<MesasUsuario>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hola desde mesas ", style: TextStyle(color: ColoresApp.darkPrimary),)
    );
  }
}