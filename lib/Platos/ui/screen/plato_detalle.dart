//Detalle de un plato
import 'package:flutter/material.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Platos/ui/screen/plato_detalle2.dart';
import 'package:rustica/Widgets/Resources/moleculas/barra_navegacion.dart';
import 'package:rustica/Widgets/Resources/moleculas/menu_vertical.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';

class Detalle extends StatefulWidget {
  final Usuario datos;
  Detalle({required this.datos});
  DetalleState createState() => DetalleState(data: datos);
}

class DetalleState extends State<Detalle> {
   final Usuario data;
   DetalleState({ required this.data });
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


    return Scaffold(
      backgroundColor: ColoresApp.fondoBlanco,
      drawer: MenuVertical(this.data),
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
          MaterialButton(
            child: Text("Detalles"),
            onPressed: () {
              //Navigator.push(
                //context,
                //MaterialPageRoute(builder: (context) => plato_detalle2()),
              //);
            },
            color: Colors.orange,
          )
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
