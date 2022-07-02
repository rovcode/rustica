
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rustica/Mesas/ui/screen/RegistrarMesa.dart';
import 'package:rustica/Reservas/ui/screen/paymentez.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';

class SeguimientosAdmin extends StatelessWidget {
  var titulo;
  var url;
  var colorfondo;
  RegistrarMesa ruta;
  

  SeguimientosAdmin(this.titulo, this.url, this.colorfondo, this.ruta, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return SizedBox(    
      width: 130,
      height: 160,
      child: Stack(

        children: <Widget>[
          Card(
              
            color: ColoresApp.fondoBlanco,      
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              
              width: 120,
              height: 120,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: InkWell(
                onTap:(() => () =>{Navigator.push(context, MaterialPageRoute(builder: (context) => ruta))}),
                child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Text(titulo,
                  style: TextStyle(
                    color: ColoresApp.fondoNegro,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ),
              )
              
              ,
            ),
          ),
          Positioned.fill(            
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Align(
               alignment: Alignment.topCenter,
              child: Container(
              height: 74,
              width: 74,
              decoration: BoxDecoration(
                color: colorfondo,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(url,),
            )),
          )) ,
        ],
      ),
    );
  }
}