import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rustica/Mesas/repository/ServiceMesas.dart';
import 'package:rustica/Mesas/ui/screen/mesas_usuario.dart';
import 'package:rustica/Reservas/ui/screen/paymentez.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Usuarios/ui/screen/PantallPrincipal.dart';
import 'package:rustica/Usuarios/ui/screen/dashboard.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class VistaMesas extends StatefulWidget {
  final int id;
  final int num_sillas;
  final String estado;
  final String piso;

  VistaMesas(
      {required this.id,
      required this.num_sillas,
      required this.estado,
      required this.piso});
  @override
  VistaMesasState createState() => VistaMesasState(
      id: id, num_sillas: num_sillas, estado: estado, piso: piso);
}

class VistaMesasState extends State<VistaMesas> {
  final int id;
  final int num_sillas;
  final String estado;
  final String piso;

  VistaMesasState(
      {required this.id,
      required this.num_sillas,
      required this.estado,
      required this.piso});
  late String numMesa = "";
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColoresApp.fondoBlanco,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 3,
      child: InkWell(
          onTap: () {
            print("Ir a opcion");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/img/mesa.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Piso " + piso,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: ColoresApp.gris,
                        ),
                      ),
                      Text(
                        "- Mesa N°",
                        style: TextStyle(
                          color: ColoresApp.gris,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        " 00" + id.toString(),
                        style: TextStyle(
                          color: ColoresApp.gris,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: 100,
                        height: 25,
                        decoration: BoxDecoration(
                          color: micolor(estado),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            estado,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.chair,
                              size: 13.0, color: ColoresApp.gris),
                          Text(
                            " " + num_sillas.toString() + " sillas",
                            style: TextStyle(
                              fontSize: 13.0,
                              color: ColoresApp.gris,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      FlatButton(
                          color: Color.fromARGB(88, 51, 51, 51),
                          onPressed: () {
                            reserva(id, estado);
                              int cod = 1;
                              String name="Prueba";
                              String phone="98086691";
                              String email="";
                              int rol_id=2;
                              final data = Usuario(id: id, name:name, phone: phone, email: email, rol_id: rol_id);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(data:data))); 
                          },
                          child: Text(textoBoton(estado).toString(),
                              style: TextStyle(color: ColoresApp.fondoBlanco))),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: ColoresApp.fondoBlanco,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: statusMesa(estado),
                  ),
                ),
              ),
            ],
          )),
    );
  }

 textoBoton(String estado) {
    if (estado == "Disponible") {
      return "Reservar";
    } else if (estado == "Ocupada") {
      return  "Pedir liberación";
    }
  }

  Color micolor(String estado) {
    Color widget;
    switch (estado) {
      case "Disponible":
        widget = const Color.fromARGB(255, 65, 243, 142);
        break;
      case "Ocupada":
        widget = const Color.fromARGB(255, 236, 45, 12);
        break;
      default:
        widget = const Color.fromARGB(255, 198, 142, 52);
    }
    return widget;
  }

  FaIcon statusMesa(String estado) {
    FaIcon widget;
    switch (estado) {
      case "Disponible":
        widget = const FaIcon(FontAwesomeIcons.check,
            size: 20.0, color: Colors.green);
        break;
      case "Ocupada":
        widget = const FaIcon(
          FontAwesomeIcons.stop,
          size: 20.0,
          color: Colors.red,
        );
        break;
      default:
        widget = const FaIcon(
          FontAwesomeIcons.warning,
          size: 20.0,
          color: Colors.yellow,
        );
    }
    return widget;
  }

  Widget gestionaEstado(String estado) {
    Widget widget;
    switch (estado) {
      case "Disponible":
        widget = Row(
          children: [
            Text(
              estado,
              style: const TextStyle(
                  color: Color.fromARGB(255, 19, 232, 33),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        );
        break;
      case "Ocupada":
        widget = Row(
          children: [
            Text(
              estado,
              style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }

  Future<void> reserva(int id, String nuevoestado) async {
    String st = "";
    //Generamos objeto mesa
    if (nuevoestado == "Disponible") {
      st = "Ocupada";
    } else if (nuevoestado == "Ocupada") {
      st = "Disponible";
    }
    Map<String, dynamic> datosmesa = {
      "estado": st,
    };
    //Instanciamos el servicios
    ServiceMesas serviceMesas = ServiceMesas();
    dynamic response = serviceMesas.reservarMesa(datosmesa, id);
    //  if(response.statusCode==200){
    //      adminAlertas("Rregistro Correcto","Se registro una nueva mesa");
    //  }else{
    //    adminAlertas("Respuesta del API","Se produjo un error en el API");
    //  }
    iniciandoservicio();
  }

  Future<void> iniciandoservicio() async {
    sendSms('931486375', 'Dick');
    print("Mensaje enviado!!!");
  }

  //Enviando SMS al usuariotkinicio=45
  late TwilioFlutter twilioFlutter;
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACb959f96a62d836b9cd375cd7c991a3a6',
        authToken: '45bad3fb75bfc2c665325d73244c386a',
        twilioNumber: '+16107568190');
    super.initState();
  }

  void sendSms(String phone, String name) async {
    twilioFlutter.sendSMS(
        toNumber: '+51' + phone,
        messageBody: 'Hola ' +
            name +
            ' se realizó una reserva, puedes seguirlo desde la web, http://api-rsu.herokuapp.com/');
  }
}
