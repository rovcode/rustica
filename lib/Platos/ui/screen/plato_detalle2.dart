import 'package:flutter/material.dart';
import 'package:rustica/Platos/casos_de_uso/ServicePlatos.dart';
import 'package:rustica/Reservas/ui/screen/paymentez.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';

class plato_detalle2 extends StatefulWidget {
  int id;
  String nombre;
  String precio;
  int starts;
  String detalles;
  plato_detalle2({required this.id, required this.nombre, required this.precio,required this.starts,required this.detalles});
  @override
  _plato_detalle2 createState() => _plato_detalle2(id:id,nombre:nombre,precio:precio,starts: starts,detalles: detalles);
}

class _plato_detalle2 extends State<plato_detalle2> {
  int id;
  String nombre;
  String precio;
  int starts;
  String detalles;
  _plato_detalle2({required this.id, required this.nombre, required this.precio,required this.starts,required this.detalles});
  bool corazon = false;
  int total = 1;

  @override
  Widget build(BuildContext context) {
    print(detalles);
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: ColoresApp.fondoBlanco,
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        //imagen con fondo:
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 275,
                          color: Colors.orange,
                          child: Image.network(detalles),
                        ),

                        //panel central
                        //puntuacion estrellas
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 140,
                              height: 30,
                              decoration: BoxDecoration(
                                  color:
                                      Colors.orange.shade200.withOpacity(0.75),
                                  borderRadius: BorderRadius.circular(140)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Estrellas: "+starts.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColoresApp.gris,
                                    ),
                                  ),
                                  Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //panel inferior
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: _headers(nombre, Colors.black, 24.0),
                            ),

                            //boton de aumento de unidades
                           
                            Container(
                              width: 100,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        if (total < 1) {
                                          setState(() {
                                            total = 1;
                                          });
                                        } else if (total > 1) {
                                          setState(() {
                                            total -= 1;
                                          });
                                        }
                                      },
                                      child: Text(
                                        "-",
                                        style: TextStyle(fontSize: 30),
                                      )),
                                  Text(
                                    "$total",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          total += 1;
                                        });
                                      },
                                      child: Text(
                                        "+",
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),

                        //ingredientes

                        SizedBox(
                          height: 10,
                        ),

                        //emojis de ingredientes
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,

                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Descripción", style: TextStyle(color: Colors.black,),), 
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                            nombre+" con ingredientes naturales",style: TextStyle(color: Colors.black,)),
                        SizedBox(
                          height: 110,
                        )
                      ],
                    ),
                  ),
                ),

                //barra superior de la pantalla:
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_rounded)),
                      Text("DETALLES DE PLATO",style: TextStyle(color: Colors.black,)),
                      IconButton(
                          onPressed: () {
                            if (corazon == false) {
                              setState(() {
                                corazon = true;
                              });
                            } else {
                              setState(() {
                                corazon = false;
                              });
                            }
                          },
                          icon: corazon == false
                              ? Icon(Icons.favorite_border_outlined)
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )),
                    ],
                  ),
                ),
                //transparencia de diseño
                Container(
                  margin: EdgeInsets.only(top: 600, left: 30, right: 30),
                  padding: EdgeInsets.only(top: 50,left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  //precio
                  child:  Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Pedido satisfactorio"),
                                  backgroundColor: Colors.green,
                                  shape: StadiumBorder(),
                                  behavior: SnackBarBehavior.floating,
                                  
                                ));
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Pasarela()));
                                //getDatos(id);
                              },
                              child: Row(children: [
                                SizedBox(width: 20.0),
                                const Text("Confimar pedido",style: TextStyle(color: Colors.white),),
                                SizedBox(width: 20.0),
                                _headers(precio, Colors.black, 15.0),
                              ]),
                        ),
                      )),
                )
              ],
            )),
      ),
    );

  }
  Widget _headers(String texto, Color color, double fontSize){
    return Text ( texto,
        style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: fontSize));
  }


}
