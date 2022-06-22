
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/dashboard/CardPublicidad.dart';
import 'package:rustica/View/dashboard/CategoriasRustica.dart';
import 'package:rustica/View/pantalla_chatbot.dart';

class PantallPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatBot()),
          );
        },
        tooltip: 'Chatbot',
        backgroundColor: ColoresApp.fondoNaranja,
        child: const Icon(Icons.message),
      ),
      backgroundColor: ColoresApp.fondoBlanco,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical:20),
                child: Text('¡Encuentra lo que deseas comer hoy!',
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
                  'Categorías',
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
              categoriaRustica(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Más consumido',
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

  categoriaRustica() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoriasRustica(
            'Zona Comida',
            'assets/icons/comida.svg',
            ColoresApp.azul,
          ),
          SizedBox(
            width: 10,
          ),
          CategoriasRustica(
            'Zona Bar',
            'assets/icons/bebida.svg',
            ColoresApp.amarillo,
          ),
          SizedBox(
            width: 10,
            
          ),
          CategoriasRustica(
           'Promociones',
            'assets/icons/promo.svg',
            ColoresApp.naranja,
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