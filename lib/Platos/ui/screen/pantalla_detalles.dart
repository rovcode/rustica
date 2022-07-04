import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rustica/Mesas/repository/ResponseMesas.dart';
import 'package:rustica/Mesas/repository/ServiceMesas.dart';
import 'package:rustica/Platos/repository/ResponsePlatos.dart';
import 'package:rustica/Platos/repository/ServicePlatos.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:http/http.dart' as http;
import 'package:rustica/Mesas/ui/screen/ViewMesas.dart';

class Pantalla_detalles extends StatefulWidget {
  @override
  Pantalla_detallesState createState() => Pantalla_detallesState();
}

class Pantalla_detallesState extends State<Pantalla_detalles> {
  ServicePlatos servicePlatos = ServicePlatos();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColoresApp.fondoBlanco,
        body: Container(
          child: FutureBuilder(
              future: servicePlatos.getDetallesPlatosApi(11),
              builder: (BuildContext context,
                  AsyncSnapshot<ResponsePlatos> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // ignore: prefer_const_constructors
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                } else {
                  print(snapshot.data!.success);
                  return ListaDetalles(snapshot.data!.data);
                }
              }),
        ));
  }
}

class ListaDetalles extends StatelessWidget {
  final List<MiDetalle> detalle;
  ListaDetalles(this.detalle);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mesas.length,
        itemBuilder: (BuildContext context, int index) {
          final mismesas = mesas[index];
          return ListTile(
            title: Container(
                child: Column(
                  children: [
                    VistaMesas(
                        id: mismesas.id,
                        num_sillas: mismesas.numSillas,
                        estado: mismesas.estado,
                        piso: mismesas.piso)
                  ],
                )),
          );
        });
  }
}
