import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rustica/Platos/casos_de_uso/ServicePlatos.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:rustica/Platos/ui/screen/plato_detalle2.dart';



class VistaPlatos extends StatefulWidget{

  final int id;
  final String nombre;
  final String precio;
  final int starts;
  final String detalles;
//trabaje con diego , dick
  VistaPlatos({required this.id, required this.nombre, required this.precio,required this.starts,required this.detalles});
  @override
  VistaPlatosState createState() => VistaPlatosState(id:id, nombre:nombre, precio:precio, starts:starts, detalles:detalles);
}
class VistaPlatosState extends State<VistaPlatos>{

  final int id;
  final String nombre;
  final String precio;
  final int starts;
  final String detalles;

  VistaPlatosState({required this.id, required this.nombre,required this.precio,required this.starts,required this.detalles});
  late String numPlato ="";

  @override
  Widget build(BuildContext context) {
    print(detalles);
    //ServicePlatos service = ServicePlatos();
    return Card(
      color: ColoresApp.fondoBlanco,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 5,
      child: InkWell(
          onTap: () {
            //service.getDetallesPlatosApi();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: 100.0,
                height: 100.0,
                // decoration: BoxDecoration(
                //   image: const DecorationImage(
                //     image: NetworkImage(''),
                //     fit: BoxFit.cover,
                //   ),
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                child: Image.network(detalles),
              ),
              
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plato: "+nombre.toString(),
                    style: TextStyle(

                      fontSize: 15,
                      color: ColoresApp.gris,
                    ),
                  ),
                  Text(
                    "Precio: "+precio.toString(),
                    style: TextStyle(

                      fontSize: 15,
                      color: ColoresApp.gris,
                    ),
                    
                  ),
                  Row(
                    children: [
                      Text(
                        "Estrellas: "+starts.toString(),
                        style: TextStyle(

                          fontSize: 15,
                          color: ColoresApp.gris,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15),
                    ],
                  ),
                  // Text(
                  //   ""+detalles.toString(),
                  //   style: TextStyle(

                  //     fontSize: 15,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40)),
                      const SizedBox(
                        width: 65,
                      ),

                      FlatButton(
                        color: ColoresApp.gris,
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => plato_detalle2(id:id, nombre:nombre, precio:precio, starts:starts, detalles:detalles)))
                        },
                        child: Row(children: [
                           const Icon(Icons.payment),
                            Text(
                          " Comprar",
                          style: TextStyle(
                            color: ColoresApp.fondoBlanco,
                          ),
                        ),
                        ],),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
      )
    );
           // children: <Widget>[
          //  ListTile(
          //     contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
        //     subtitle: Text(
        //          'Plato: '+nombre.toString() +'\n'
        //            'Precio: '+precio.toString() +'\n'
        //            'Estrellas: '+starts.toString()+'\n',
          //             style: TextStyle(
          //              color: ColoresApp.gris, fontSize: 14,
        //              fontWeight: FontWeight.bold),
          //        ),
        //      leading: Column(children: [
        //          Icon(Icons.fastfood_rounded, color: Colors.amber, size: 47),
        //        ],)
//
        //            ),
        //    Row(

        //      mainAxisAlignment: MainAxisAlignment.center,
        //      children: [
        //        SvgPicture.asset("assets/icons/c1.svg",height: 30, width: 30),
        //        SvgPicture.asset("assets/icons/c2.svg",height: 30, width: 30),
        //        SvgPicture.asset("assets/icons/c3.svg",height: 30, width: 30),
        //        SvgPicture.asset("assets/icons/c4.svg",height: 30, width: 30),
        //      ],
        //    ),
        //    Row(
        //      mainAxisAlignment: MainAxisAlignment.start,
        //      children: <Widget>[
        //        const SizedBox(
        //          width: 10.0,
        //          height: 10.0,
//
        ////                ),

    //  FlatButton(

    //    color:  Color.fromARGB(88, 51, 51, 51),
    //                onPressed:() => {
    //                  Navigator.push(context, MaterialPageRoute(builder: (context) => plato_detalle2(id:id)))
//
    //                    },
          //              child: Text('Ver Detalle',
    //              style: TextStyle(color: ColoresApp.fondoBlanco))),

        // ],

        //     )
        //   ],
    // )),
    // );
  }
}