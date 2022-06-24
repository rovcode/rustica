import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rustica/View/admin/Seguimiento.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/dashboard/CardPublicidad.dart';
import 'package:rustica/View/pantalla_chatbot.dart';

class DashboardAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => ChatBot()),
      //     );
      //   },
      //   tooltip: 'Chatbot',
      //   backgroundColor: ColoresApp.fondoNaranja,
      //   child: const Icon(Icons.message),
      // ),
      backgroundColor: ColoresApp.fondoBlanco,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical:20),
                child: Text('Panel de administración',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: ColoresApp.darkPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Accesos de seguimiento',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColoresApp.darkPrimary,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              seguimiento(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Notificaciones',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColoresApp.darkPrimary,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              masconsumido(),
            ],
          ),
        ),
      ),
    );
  }

  seguimiento() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          SeguimientosAdmin(
            'Ventas',
            'assets/icons/ventas.svg',Colors.transparent,
          ),
          SizedBox(
            width: 10,
          ),
          SeguimientosAdmin(
            'Calificación',
            'assets/icons/checklist.svg',
            Colors.transparent,
          ),
          SizedBox(
            width: 10,
            
          ),
          SeguimientosAdmin(
           'Stock',
            'assets/icons/stock.svg',
            Colors.transparent,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  masconsumido() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          CardPublicidad(
            'ALITAS ACEVICHADAS',
            '14 Alitas con salsa acevichada',
            'assets/img/alitas.jpeg',
            ColoresApp.azul,
          ),
          SizedBox(
            height: 20,
          ),
          CardPublicidad(
            'TORRE DE PIQUEOS',
            'Chicharrón Pollo Alitas Bbq',
            'assets/img/torre.jpg',
            ColoresApp.amarillo,
          ),
          SizedBox(
            height: 20,
          ),
          CardPublicidad(
            'COMBO POKER DE PASTAS',
            'Poker en salsa de carne',
            'assets/img/comonopoker.jpeg',
            ColoresApp.naranja,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}