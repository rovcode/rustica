import 'package:flutter/material.dart';
import 'package:rustica/View/Usuario/WidgetApi.dart';
import 'package:rustica/View/Usuario/pantalla_platos.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/pantalla_login.dart';

class GestorMenuApp extends StatefulWidget {
  final int tipousuarios;
  GestorMenuApp({required this.tipousuarios});
  @override
  // ignore: no_logic_in_create_state
  GestorMemnuAppState createState() => GestorMemnuAppState(tipo: tipousuarios);
}

class GestorMemnuAppState extends State<GestorMenuApp> {
  final int tipo;
  GestorMemnuAppState({required this.tipo});
  @override
  Widget build(BuildContext context) {
     return tipoMenu(tipo);
  }

  Widget tipoMenu(int id) {
    Widget widget;
    switch (id) {
      case 2:
        widget = Column(children: [
          opcionMenu(icon: Icons.home, nombre: "Dashboard",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.table_bar, nombre: "Mesas",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.delivery_dining, nombre: "Mis Pedidos",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.food_bank, nombre: "Platos",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.settings, nombre: "Configuración",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
           Container(
              margin: EdgeInsets.all(20),
             child: FlatButton(
                    color: ColoresApp.fondoNegro ,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: Row(children: [
                      Icon(Icons.exit_to_app),
                      Text("Cerrar Sesión",style: TextStyle(color: ColoresApp.fondoBlanco),)
                    ]),
                  ),
           )
          ]);
        break;
      case 1:
        widget =  Column(children: [
          opcionMenu(icon: Icons.home, nombre: "Dashboard",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.file_copy_sharp, nombre: "Facturas",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.monetization_on, nombre: "Ventas",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.stop, nombre: "Productos",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.account_box_outlined, nombre: "Trabajadores",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.online_prediction, nombre: "En tiempo real",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.settings, nombre: "Configuración",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
           Container(
              margin: EdgeInsets.all(20),
             child: FlatButton(
                    color: ColoresApp.fondoNegro ,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: Row(children: [
                      Icon(Icons.exit_to_app),
                      Text("Cerrar Sesión",style: TextStyle(color: ColoresApp.fondoBlanco),)
                    ]),
                  ),
           )
          ]);
        break;
      default:
        widget = Container();
    }
    return widget;
  }
  //Creamos el Item del menuVertical
  Widget opcionMenu(
      {IconData? icon, String? nombre, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: ColoresApp.darkPrimary,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              nombre!,
              style: TextStyle(color: ColoresApp.darkPrimary),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
