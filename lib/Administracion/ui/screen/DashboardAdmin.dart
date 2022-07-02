import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rustica/Administracion/ui/screen/Seguimiento.dart';
import 'package:rustica/Mesas/ui/screen/RegistrarMesa.dart';
import 'package:rustica/Reservas/ui/screen/paymentez.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:rustica/Usuarios/ui/screen/CardPublicidad.dart';
import 'package:rustica/Widgets/ChatBot/pantalla_chatbot.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardAdmin extends StatelessWidget {
  final adminweb = Uri.parse("http://api-rsu.herokuapp.com/");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp.fondoBlanco,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  'Panel de administración',
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
                child: Container(
                  child: Row(
                    children: [
                      Text('Accesos de seguimiento',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColoresApp.darkPrimary,
                            fontSize: 18,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30)),
                          color: ColoresApp.lightPrimary,
                          onPressed: administradorweb,
                          child: Text('Admin Web',
                              style: TextStyle(
                                color: ColoresApp.darkPrimary,
                              )),
                        ),
                      ),
                    ],
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
                child: Text(
                  'Notificaciones',
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

  void administradorweb() async {
    if (!await launchUrl(adminweb)) throw 'ERROR DE PERMISOS $adminweb';
  }
 RegistrarMesa reg = new RegistrarMesa();
  seguimiento({GestureTapCallback? onTap}) {
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 30, ),
          SeguimientosAdmin('Ventas','assets/icons/ventas.svg',Colors.transparent,reg ),
          const SizedBox( width: 10,),
          SeguimientosAdmin( 'Calificación','assets/icons/checklist.svg',Colors.transparent,reg),
          const SizedBox( width: 10,),
          SeguimientosAdmin('Stock','assets/icons/stock.svg',Colors.transparent,reg),
          const SizedBox( width: 30,),
          InkWell(child: SeguimientosAdmin( 'Mesas','assets/icons/addmesa.svg',Colors.transparent,reg)),
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
