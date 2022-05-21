//Dashboard del usuario
import 'package:flutter/material.dart';
import 'package:rustica/ui/atomic-design/tokens/ColoresApp.dart';

import '../../atomic-design/moleculas/menu_vertical.dart';

class Dashboard extends StatefulWidget{
    DashboardState createState() => DashboardState();
}
class DashboardState extends State<Dashboard>{
 @override
   Widget build(BuildContext context) {
    return Container(child: MenuVertical(),);
    // Scaffold(
    //   backgroundColor: ColoresApp.lightPrimary,
    //   appBar: AppBar(title: Text('Dashboard'),backgroundColor:ColoresApp.darkPrimary ),
    //   body: Column(
    //     children: [Dashboard()],
    // ));
  }
}