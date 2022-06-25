import 'package:flutter/material.dart';

class plato_detalle2 extends StatefulWidget{

  var chaufa;

  plato_detalle2([this.chaufa]);


  @override

  _plato_detalle2 createState() => _plato_detalle2();

}

class _plato_detalle2 extends State<plato_detalle2>{

  bool corazon = false;
  int total = 1;

  @override
  Widget build(BuildContext context){

    return Scaffold(

      body: SafeArea(
        child: Container(

          padding: EdgeInsets.all(15.0),
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

                      SizedBox(height: 15,),

                      //imagen con fondo:
                      Container(

                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.orange,
                        child: Image.asset('assets/img/arrozchaufa.jpg'),

                      ),

                      //panel central
                      //puntuacion estrellas
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade200.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(50)
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: 20,),
                                SizedBox(width: 3,),
                                Text("")

                              ],


                            ),),
                        ],
                      ),

                      //panel inferior
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 20,
                            color: Colors.black,
                            child: Text("ARROZ CHAUFA"),

                          ),

                          //boton de aumento de unidades
                          SizedBox(width: 20,),
                          Container(
                            width: 100,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(10)

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                InkWell(onTap:(){
                                  if(total < 1){

                                    setState((){
                                      total = 1;
                                    });

                                  }else if(total > 1){

                                    setState((){
                                      total -=1;
                                    });
                                  }


                                },child: Text("-", style: TextStyle(fontSize: 30),)),
                                Text("$total", style: TextStyle(fontSize: 20),),

                                InkWell(onTap:(){
                                  setState((){
                                    total +=1;
                                  });

                                },child: Text("+", style: TextStyle(fontSize: 20),)),


                              ],
                            ),

                          )

                        ],
                      ),

                      //ingredientes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Ingredientes"),
                        ],
                      ),
                      SizedBox(height: 10,),

                      //emojis de ingredientes
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: Offset(0,4),
                                        blurRadius: 4

                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Text("🍗", style: TextStyle(fontSize: 24),),
                                  SizedBox(height: 5,),
                                  Text("pollo",),



                                ],
                              ),
                            ),

                            SizedBox(width: 15,),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: Offset(0,4),
                                        blurRadius: 4

                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Text("🍚", style: TextStyle(fontSize: 24),),
                                  SizedBox(height: 5,),
                                  Text("arroz",),



                                ],
                              ),
                            ),
                            SizedBox(width: 15,),

                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: Offset(0,4),
                                        blurRadius: 4

                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Text("🥚", style: TextStyle(fontSize: 24),),
                                  SizedBox(height: 5,),
                                  Text("huevo",),



                                ],
                              ),
                            ),
                            SizedBox(width: 15,),

                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: Offset(0,4),
                                        blurRadius: 4

                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Text("🧅", style: TextStyle(fontSize: 24),),
                                  SizedBox(height: 5,),
                                  Text("cebolla",),



                                ],
                              ),
                            ),
                            SizedBox(width: 15,),

                          ],
                        ),
                      ),

                      //descripcion de comida
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Descripción"),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Arroz chaufa de pollo con ingredientes naturales"),
                      SizedBox(height: 110,)




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

                    IconButton(onPressed: (){

                      Navigator.pop(context);

                    }, icon: Icon(Icons.arrow_back_rounded)),
                    Text("DETALLES DE PLATO"),
                    IconButton(onPressed: (){

                      if(corazon == false){
                        setState((){

                          corazon = true;

                        });
                      } else {
                        setState((){
                          corazon = false;

                        });
                      }


                    }, icon: corazon == false ? Icon(Icons.favorite_border_outlined) :  Icon(Icons.favorite,color: Colors.red,)),

                  ],
                ),


              ),
              //transparencia de diseño
              Container(
                margin: EdgeInsets.only(top: 600),
                padding: EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white.withOpacity(0), Colors.white]
                  )
                ),

                //precio
                child: Row(
                  children: [
                    Text("\S/11", style: TextStyle(color: Colors.black),),
                    Text("",),
                    SizedBox(width: 150,),
                    Container(
                      width: 190,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Center(
                        child: GestureDetector(
                            onTap: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Pedido satisfactorio"),backgroundColor: Colors.green,
                                    shape: StadiumBorder(),
                                    behavior: SnackBarBehavior.floating,));
                            },

                            child: Text("Confimar pedido", style: TextStyle(color: Colors.white),)),
                      ),

                    )
                  ],
                ),
              )



            ],
          )

        ),
      ),

    );

  }


}
