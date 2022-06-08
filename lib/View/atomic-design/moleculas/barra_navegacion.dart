import 'package:flutter/material.dart';
import 'package:rustica/View/Usuario/pantalla_platos.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/Usuario/explorar.dart';
import 'package:rustica/View//Usuario/mesas_usuario.dart';
import 'package:rustica/View/Usuario/principal.dart';
import 'package:rustica/View/Usuario/red_social_usuarios.dart';


class BarraNavegacion extends StatefulWidget {
  @override
  BarraNavegacionState createState() => BarraNavegacionState();
}

class BarraNavegacionState extends State<BarraNavegacion> {
  //Declaramos una variable para la validar opción selecionada
  int _opSeleccionada=0;
   static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

   static List<Widget> get WidgetOpciones => [Principal(),Platos(),MesasUsuario(),RedSocial()];
  
  ///Creamos una funcion para validar el state  
  void _clickRealizado(int i){
     setState(() {
       _opSeleccionada = i;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp.fondoBlanco,
      body: Center(
        child: 
        WidgetOpciones.elementAt((_opSeleccionada),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        //op1
         BottomNavigationBarItem( 
           backgroundColor: Color(0xffffa900),
           icon: Icon(Icons.home_filled),label: 'Principal', ),
           
        //op2
         BottomNavigationBarItem( icon: Icon(Icons.explore),label: 'Explorar',),
        //op3
         BottomNavigationBarItem( icon: Icon(Icons.restaurant_menu),label: 'Mesas',),
        //op4
         BottomNavigationBarItem( icon: Icon(Icons.supervised_user_circle_sharp),label: 'Conectar',),
      ],
        currentIndex: _opSeleccionada,
        selectedItemColor: ColoresApp.fondoBlanco,
        onTap: _clickRealizado,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

