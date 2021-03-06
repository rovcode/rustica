import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rustica/Mesas/repository/ResponseMesas.dart';
import 'package:rustica/Mesas/casos_de_uso/ServiceMesas.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:http/http.dart' as http;
import 'package:rustica/Mesas/ui/screen/ViewMesas.dart';

class MesasUsuario extends StatefulWidget {
  final Usuario usuario;
  MesasUsuario({required this.usuario});
  @override
  MesasUsuarioState createState() => MesasUsuarioState(miuser: usuario);
}

class MesasUsuarioState extends State<MesasUsuario> {
  final Usuario miuser;
  MesasUsuarioState({required this.miuser});
  ServiceMesas serviceMesas = ServiceMesas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColoresApp.fondoBlanco,
        body: Container( 
          child: FutureBuilder(
              future: serviceMesas.getMesasApi(),            
              builder: (BuildContext context,
                  AsyncSnapshot<ResponseMesas> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // ignore: prefer_const_constructors
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                } else {
                  print(snapshot.data!.success);
                  return ListaMesas(snapshot.data!.data, miuser);
                }
              }),
        ));
  }
}

class ListaMesas extends StatelessWidget {
  final List<MiMesa> mesas;
  final Usuario miuser;
  ListaMesas(this.mesas, this.miuser);
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
                    piso: mismesas.piso, user:miuser)
              ],
            )),
          );
        });
  }
}
