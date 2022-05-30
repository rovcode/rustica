//Platos de la carta
import 'package:flutter/material.dart';
import 'package:rustica/View/atomic-design/moleculas/barra_navegacion.dart';
import 'package:rustica/View/atomic-design/moleculas/menu_vertical.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/Usuario/plato_detalle.dart';

class Platos extends StatefulWidget {
  PlatosState createState() => PlatosState();
}

class PlatosState extends State<Platos> {
  @override
  Widget build(BuildContext context) {

    Widget Cuadro1 = Opacity(
      opacity: 0.5,

      child: InkWell(
       child: Container(
         margin: const EdgeInsets.all(30.0),
         height: 200,
         width: 100,
         decoration: BoxDecoration(
           color: Colors.blue,
           borderRadius: const BorderRadius.all(
               Radius.circular(32)
           ),
           boxShadow: [BoxShadow(
               color: Colors.grey[850]!.withOpacity(0.29),
               offset: const Offset(-10,10),
               blurRadius: 10,
               spreadRadius: 10
           )],
           image: const DecorationImage(
             image: AssetImage('assets/img/arrozchaufa.jpg'),
             fit: BoxFit.cover,
           ),
         ),
         child: const Center(
           child: Text(
             'Arroz Chaufa ',
             style: TextStyle(
               fontSize: 25,
               color: Colors.black,
               fontWeight: FontWeight.bold,
               letterSpacing: 1.5,
             ),
           ),
         ),
       ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Detalle()));
        },
      ),
    );

    Widget Cuadro2 = Opacity(
      opacity: 0.5,

      child: InkWell(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          height: 200,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: const BorderRadius.all(
                Radius.circular(32)
            ),
            boxShadow: [BoxShadow(
                color: Colors.grey[850]!.withOpacity(0.29),
                offset: const Offset(-10,10),
                blurRadius: 10,
                spreadRadius: 10
            )],
            image: const DecorationImage(
              image: AssetImage('assets/img/pollobroaster.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'Pollo Broaster',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),

      ),
    );

    Widget Cuadro3 = Opacity(
      opacity: 0.5,
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          height: 200,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: const BorderRadius.all(
                Radius.circular(32)
            ),
            boxShadow: [BoxShadow(
                color: Colors.grey[850]!.withOpacity(0.29),
                offset: const Offset(-10,10),
                blurRadius: 10,
                spreadRadius: 10
            )],
            image: const DecorationImage(
              image: AssetImage('assets/img/pollobrasa.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'Pollo a la Brasa',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),

      ),
    );

    return Scaffold(
      backgroundColor: ColoresApp.fondoBlanco,
      drawer: MenuVertical(),
      appBar: AppBar(

        backgroundColor: ColoresApp.fondoNaranja,
        elevation: 0.0,
        actions: [
          IconButton(
            color: ColoresApp.fondoBlanco,
            icon: Icon(Icons.notifications),
            onPressed: (){

            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Cuadro1,
          Cuadro2,
          Cuadro3,
        ],
      ),
    );
  }
}
