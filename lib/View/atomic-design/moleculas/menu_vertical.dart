import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rustica/Model/db/User.dart';
import 'package:rustica/View/Usuario/WidgetApi.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import '../../Usuario/pantalla_platos.dart';

class MenuVertical extends StatefulWidget {
  final Usuario datos;
  MenuVertical(this.datos);
  @override
  MenuVerticalStatus createState() => MenuVerticalStatus(datos: datos);
}

class MenuVerticalStatus extends State<MenuVertical> {
  final Usuario datos;
  MenuVerticalStatus({required this.datos});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColoresApp.fondoBlanco,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          header_app(datos.name, datos.email),
          opcionMenu(
              icon: Icons.home,
              nombre: "Dashboard",
              onTap: () => {
                    // Navigator.pushReplacementNamed(context, MyHomePage=>()):
                  }),
          opcionMenu(
              icon: Icons.tab_outlined,
              nombre: "Mesas",
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>WidgetApi()));
              }),
          opcionMenu(
              icon: Icons.delivery_dining,
              nombre: "Pedidos",
              onTap: () => {
                    // Navigator.pushReplacementNamed(context, MyHomePage=>()):
                  }),
          opcionMenu(
              icon: Icons.food_bank_rounded,
              nombre: "Platos",
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Platos()));
              }),
          opcionMenu(
              icon: Icons.api,
              nombre: "API",
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => WidgetApi()));
              }),
          opcionMenu(
              icon: Icons.settings,
              nombre: "Configuración",
              onTap: () => {
                    // Navigator.pushReplacementNamed(context, MyHomePage=>()):
                  })
        ],
      ),
    );
  }

  //Creamos el head de la app donde podremos mostrar el perfil del usuario
  Widget header_app(String name, String mail) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/img/fogo_default.webp"))),
              child: UserAccountsDrawerHeader(                 
                 decoration: BoxDecoration(
                    color: Colors.transparent
                ),
                accountName: Text(name),
                accountEmail: Text(mail),
                // ignore: prefer_const_constructors
                currentAccountPicture:  CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:const AssetImage("assets/img/avatardafault.jpg"),
        ),
      ),
    );
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
