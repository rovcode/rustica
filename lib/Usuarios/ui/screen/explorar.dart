import 'package:flutter/material.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';


class Explorar extends StatefulWidget {
  @override
  ExplorarState createState() => ExplorarState();
}

class ExplorarState extends State<Explorar> {
  Widget build(BuildContext context) {
     return Container(
        child: Text("Hola desde explore", style:TextStyle(color: ColoresApp.darkPrimary),),
     );
  }
}