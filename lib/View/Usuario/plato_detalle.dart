//Detalle de un plato
import 'package:flutter/material.dart';
import 'package:rustica/View/atomic-design/moleculas/barra_navegacion.dart';
import 'package:rustica/View/atomic-design/moleculas/menu_vertical.dart';
import 'package:rustica/View/atomic-design/tokens/ColoresApp.dart';

class Detalle extends StatefulWidget {
  DetalleState createState() => DetalleState();
}

class DetalleState extends State<Detalle> {
  @override
  Widget build(BuildContext context) {

    Widget Descripcion_plato = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Arroz Chaufa',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Plato Personal',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.attach_money,
            color: Colors.black,
          ),
          const Text('19.00',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );

    Color color = Colors.orange;

    Widget Acciones = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.shopping_cart_outlined, 'Agregar'),
      ],
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
              onPressed: () {

              }),
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/img/arrozchaufa.jpg',
            fit: BoxFit.cover,
          ),
          Descripcion_plato,
          Acciones,
        ],
      ),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
