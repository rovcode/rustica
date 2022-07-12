//Platos de la carta
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rustica/Platos/repository/ResponsePlatos.dart';
import 'package:rustica/Platos/casos_de_uso/ServicePlatos.dart';
import 'package:rustica/Platos/ui/screen/ViewPlatos.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';


class Platos extends StatefulWidget {
  final Usuario data;
  Platos({required this.data});
  PlatosState createState() => PlatosState(data:data);
}

class PlatosState extends State<Platos> {
  final Usuario data;
  PlatosState({required this.data});
  @override

  Future<ResponsePlatos> getPlatosApi() async {
    final response = await http.get('http://api-rsu.herokuapp.com/api/platos');
    return responsePlatosFromJson(response.body);
  }

  ServicePlatos servicePlatos = ServicePlatos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColoresApp.fondoBlanco,
        body: Container(
          child: FutureBuilder(
              future: servicePlatos.getPlatosApi(),
              builder: (BuildContext context,
                  AsyncSnapshot<ResponsePlatos> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // ignore: prefer_const_constructors
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                } else {
                  print(snapshot);
                  return ListaPlatos(snapshot.data!.data);
                }
              }),
        ));
  }
}
class ListaPlatos extends StatelessWidget {
  final List<MisPlatos> platos;
  ListaPlatos(this.platos);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: platos.length,
        itemBuilder: (BuildContext context, int index) {
          final plato = platos[index];
          return ListTile(
            title: Container(
                child: Column(
                  children: [
                    VistaPlatos(id:plato.id, nombre:plato.nombre, precio:plato.precio, starts:plato.starts, detalles:plato.detalles)
                  ],
                )),
          );
        });
  }
}