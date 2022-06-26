import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rustica/Model/Mesa.dart';
import 'package:rustica/Model/ResponseMesas.dart';
import 'package:rustica/Model/db/ServiceMesas.dart';
import 'package:rustica/View/Usuario/PantallaMesas.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:http/http.dart' as http;
import 'package:rustica/View/atomic-design/moleculas/WidgetMesa.dart';

class MesasUsuario extends StatefulWidget {
  @override
  MesasUsuarioState createState() => MesasUsuarioState();
}

class MesasUsuarioState extends State<MesasUsuario> {
  Future<ResponseMesas> getMesasApi() async {
    final response = await http.get('http://api-rsu.herokuapp.com/api/mesas');
    return responseMesasFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColoresApp.fondoBlanco,
        body: Container(
          child: FutureBuilder(
              future: getMesasApi(),
              builder: (BuildContext context,
                  AsyncSnapshot<ResponseMesas> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // ignore: prefer_const_constructors
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                } else {
                  print(snapshot.data!.success);
                  return ListaMesas(snapshot.data!.data);
                }
              }),
        ));
  }
}

//   Widget asycnHelper(AsyncSnapshot snapshot) {
//     Widget element = Container();
//     if (snapshot.hasError) {
//       element = Text('Error ');
//     } else if (!snapshot.hasData) {
//       element = Center(
//         child: CircularProgressIndicator(),
//       );
//     } else {
//       element = const ListaMesas2(num_sillas:snapshot.data.num_sillas, estado:snapshot.data.estado, piso:'ss');
//     }
//     return element;
//   }
// }
// class ListaMesas2 extends StatelessWidget {
//    final int num_sillas;
//    final String estado;
//    final String piso;
//   const ListaMesas2({required this.num_sillas,required this.estado, required this.piso});
//   @override
//   Widget build(BuildContext context) {
//     print(this.num_sillas);
//     return ListView();
//   }
// }
class ListaMesas extends StatelessWidget {
  final List<MiMesa> mesas;
  ListaMesas(this.mesas);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mesas.length,
        itemBuilder: (BuildContext context, int index) {
          final usuario = mesas[index];
          return ListTile(
            title: Container(
                child: Column(
              children: [
                ViewMesa(
                    usuario.id, usuario.numSillas, usuario.estado, usuario.piso)
              ],
            )),
          );
        });
  }
}
