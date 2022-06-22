import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rustica/Model/db/User.dart';
import 'package:rustica/View/Usuario/WidgetApi.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/atomic-design/moleculas/gestor_menu_app.dart';
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
    print(datos.rol_id);
    return Drawer(
      backgroundColor: ColoresApp.fondoBlanco,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          header_app(datos.name, datos.email, datos.rol_id),          
          GestorMenuApp(tipousuarios: datos.rol_id)
        ],
      ),
    );
  }

  //Creamos el head de la app donde podremos mostrar el perfil del usuario
  Widget header_app(String name, String mail, int id) {
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
                accountName: Text(name+" - "+tipoUsurio(id)),
                accountEmail: Text(mail),
                // ignore: prefer_const_constructors
                currentAccountPicture:  CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:const AssetImage("assets/img/avatardafault.jpg"),
        ),
      ),
    );
  }
  tipoUsurio(int id){
    if(id ==1){
       return "Adminstrador";
    }else if(id==2){
      return "Cliente";
    }else if(id ==3){
      return "Vendedor";
    }else{
      return "Staff";
    }
   
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
