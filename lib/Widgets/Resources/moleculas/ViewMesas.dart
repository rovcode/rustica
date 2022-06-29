import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class VistaMesas extends StatefulWidget{
  final int id;
  final int num_sillas;
  final String estado;
  final String piso;
   
  VistaMesas({required this.id, required this.num_sillas, required this.estado,required this.piso});
  @override
  VistaMesasState createState() => VistaMesasState(id:id, num_sillas:num_sillas, estado:estado, piso:piso);
}
class VistaMesasState extends State<VistaMesas>{
  final int id;
  final int num_sillas;
  final String estado;
  final String piso;
   
  VistaMesasState({required this.id,required this.num_sillas,required this.estado,required this.piso});
  late String numMesa ="";
  @override
 Widget build(BuildContext context) {
    
    return Card(
      color: ColoresApp.fondoBlanco,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 5,
      child: InkWell(
          onTap: () {
            print("Ir a opcion");
          },
          child: Column(
            children: <Widget>[
              ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                  title: gestionaEstado(estado),
                  subtitle: Text(
                      "Reserve su mesa y en seguida un mozo asignado le atenderá",
                      style: TextStyle(color: ColoresApp.darkPrimary, fontSize: 10)),
                  leading: Column(children: [
                    Icon(Icons.table_bar, color: Colors.amber,),
                    Text('N° 00'+id.toString(), style: TextStyle(color: ColoresApp.fondoNaranja, fontWeight: FontWeight.bold))
                  ],)
              ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
               children: [
                SvgPicture.asset("assets/icons/c1.svg",height: 30, width: 30),
                SvgPicture.asset("assets/icons/c2.svg",height: 30, width: 30),
                SvgPicture.asset("assets/icons/c3.svg",height: 30, width: 30),
                SvgPicture.asset("assets/icons/c4.svg",height: 30, width: 30),
               ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                      onPressed:iniciandoservicio,
                      child: Text('Reservar',
                          style: TextStyle(color: ColoresApp.darkPrimary))),
                  FlatButton(
                      onPressed: () => {},
                      child: Text('Reportar',
                          style: TextStyle(color: ColoresApp.darkPrimary)))
                ],
              )
            ],
          )),
    );
  }
  Widget gestionaEstado(String estado) {
    Widget widget;
    switch (estado) {
      case "Disponible":
        widget = Row(
          children: [
            const Text("Estado: ",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text(
              estado,
              style: TextStyle(color: Colors.green[900]),
            )
          ],
        );
        break;
      case "Ocupada":
        widget = Row(
          children: [
            const Text("Estado: ",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text(
              estado,
              style: TextStyle(color: Colors.red[900]),
            )
          ],
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }
   Future<void> iniciandoservicio() async {
        sendSms('980866911','Rony');
       print("Mensaje enviado!!!");
    }
   //Enviando SMS al usuariotkinicio=45
  late TwilioFlutter twilioFlutter;
  void initState() {
      twilioFlutter =TwilioFlutter(accountSid: 'ACb959f96a62d836b9cd375cd7c991a3a6', authToken: 'bad3fb75bfc2c665325d73244c386a', twilioNumber: '+16107568190');
      super.initState();
    }
    void sendSms(String phone,String name) async {
      twilioFlutter.sendSMS(toNumber: '+51'+phone, messageBody: 'Hola '+name+' se realizó una reserva, puedes seguirlo desde la web, http://api-rsu.herokuapp.com/');
    }
}