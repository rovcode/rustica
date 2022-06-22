//Dashboard del usuario
import 'package:flutter/material.dart';
import 'package:rustica/Model/db/User.dart';
import 'package:rustica/View/atomic-design/moleculas/barra_navegacion.dart';
import 'package:rustica/View/atomic-design/moleculas/menu_vertical.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';


class Dashboard extends StatefulWidget {
  final Usuario data;
  Dashboard({required this.data});
  @override
  DashboardState createState() => DashboardState(data: data);
 
}

class DashboardState extends State<Dashboard> {
  final Usuario data;
   DashboardState({ required this.data });
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp.fondoBlanco,
      drawer: MenuVertical(this.data),
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
      body: BarraNavegacion(),
    );
  }
}
