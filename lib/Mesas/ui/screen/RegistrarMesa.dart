// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rustica/Mesas/casos_de_uso/ServiceMesas.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class RegistrarMesa extends StatefulWidget{
 const RegistrarMesa({GestureTapCallback? onTap});

  @override
  RegistrarMesaState createState() => RegistrarMesaState();
}
class RegistrarMesaState extends State<RegistrarMesa>{
  final _formKey = GlobalKey<FormState>();
  final numsillas = TextEditingController();
  final estado = TextEditingController();
  final piso = TextEditingController();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: ColoresApp.fondoNegro,
    appBar: AppBar(
       backgroundColor: ColoresApp.fondoNaranja,
       title: const Text("Registrar Mesa"),
    ) ,
    body: Container(
        child: SingleChildScrollView(child:  Form( 
          //1 Form como raiz de nuestro formulario
          key: _formKey,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                     Container(
                      margin: const EdgeInsets.all(30),
                      child: TextFormField(
                      controller: numsillas,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.numbers),
                        labelText: 'Número de Sillas',
                        //helperText: 'Sólo un numero',
                        suffixIcon: Icon(
                          Icons.check_circle,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese número';
                        }
                      }
                    )),
                    Container(
                      margin: const EdgeInsets.all(30),
                      child: TextFormField(
                      controller: estado,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.star_rate),
                        labelText: 'Estado',
                        //helperText: 'Sólo un numero',
                        suffixIcon: Icon(
                          Icons.check_circle,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese estado';
                        }
                      }
                    )),
                    Container(
                      margin: const EdgeInsets.all(30),
                      child: TextFormField(
                      controller: piso,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.home_filled),
                        labelText: 'Piso',
                        //helperText: 'Sólo un numero',
                        suffixIcon: Icon(
                          Icons.check_circle,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese piso';
                        }
                      }
                    )),
                    regitrarMesa(),            
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ), //2
            ],
          )),
        )),
      ),
    );
  }
   Widget regitrarMesa() {
    return Container(
        margin: const EdgeInsets.only(top: 35),
        child: Center(
          child: Card(
              color: ColoresApp.darkPrimary,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 20,
                runSpacing: 20,
                children: [
                  const Align(alignment: Alignment.center,),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: ColoresApp.fondoNaranja,
                      onPressed:registrarMesa,
                      child: Text('Registrar Mesa',
                          style: TextStyle(
                            color: ColoresApp.fondoBlanco,
                          )),
                    ),
                  )
                ],
              )),
        ));
    }
  //Creamos el formulario dentro de un Future.
  Future<void> registrarMesa() async{
     if(_formKey.currentState!.validate()){
       //Generamos objeto mesa
        Map<String, dynamic> datosmesa ={
            "num_sillas":numsillas.text,
            "estado":estado.text,
            "piso": piso.text,
         };
         //Instanciamos el servicios
         ServiceMesas serviceMesas = ServiceMesas();
         dynamic response = serviceMesas.registrarMesas(datosmesa);
          Navigator.of(context).pop();
      //  if(response.statusCode==200){
      //      adminAlertas("Rregistro Correcto","Se registro una nueva mesa");
      //  }else{
      //    adminAlertas("Respuesta del API","Se produjo un error en el API");
      //  }
     }else{
       adminAlertas("Error en registro","No fue posible registrar la mesa");
     }
  }
  adminAlertas(String titulo, String mensaje){
     showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type AlertDialog
              return AlertDialog(
                title: Text(titulo),
                content: Text(mensaje),
                actions: <Widget>[ FlatButton(
                    child:const Text("Cerrar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
  }
}
