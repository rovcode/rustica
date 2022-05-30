import 'package:flutter/material.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hola desde principal", style: TextStyle(color: ColoresApp.darkPrimary),) ,
    );
  }

}