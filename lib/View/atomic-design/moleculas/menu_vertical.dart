import 'package:flutter/material.dart';
import 'package:rustica/View/Usuario/WidgetApi.dart';
import 'package:rustica/View/atomic-design/tokens/ColoresApp.dart';


class MenuVertical extends StatefulWidget{
 @override
MenuVerticalStatus createState() => MenuVerticalStatus();
}

class MenuVerticalStatus extends State<MenuVertical>{
 @override
 Widget build(BuildContext context){
   return  Drawer(
          backgroundColor:ColoresApp.fondoBlanco,
          child: ListView(
          
            padding: EdgeInsets.zero,
            children: [
              header_app(),
              opcionMenu(icon: Icons.home, nombre:"Dashboard", onTap:()=>{
                // Navigator.pushReplacementNamed(context, MyHomePage=>()):
              }),
              opcionMenu(icon: Icons.tab_outlined, nombre:"Mesas", onTap:(){
                // Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>WidgetApi()));
              }),             
              opcionMenu(icon: Icons.delivery_dining, nombre:"Pedidos", onTap:()=>{
                // Navigator.pushReplacementNamed(context, MyHomePage=>()):
              }),
               opcionMenu(icon: Icons.api, nombre:"API", onTap:(){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>WidgetApi()));
              }),
              opcionMenu(icon: Icons.settings, nombre:"Configuración", onTap:()=>{
                // Navigator.pushReplacementNamed(context, MyHomePage=>()):
              })
              
            ],
          ),
        );
 }
 //Creamos el head de la app donde podremos mostrar el perfil del usuario
 Widget header_app(){
   return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration:BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/img/fogo_default.webp"))),
      child: Stack(
        children: <Widget>[
             Center(child: Positioned(
              bottom: 20.00,
              left: 20.00,
              child: Text("Rony Velásquez",style: TextStyle(color: ColoresApp.lightPrimary,fontSize: 25.00,fontWeight:FontWeight.w500),)),)
        ]
      ),
   );
 }
 //Creamos el Item del menuVertical
 Widget opcionMenu({IconData? icon, String? nombre, GestureTapCallback? onTap}){
    return ListTile(

      title: Row(
        children: <Widget> [
          Icon(icon,color: ColoresApp.darkPrimary,),
          Padding(padding: EdgeInsets.only(left: 8.0), child: Text(nombre!,style: TextStyle(color: ColoresApp.darkPrimary),),
          )
        ],
      ),
      onTap: onTap,
    );
 }
}