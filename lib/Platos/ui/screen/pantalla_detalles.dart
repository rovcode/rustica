// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:rustica/Mesas/repository/ResponseMesas.dart';
// import 'package:rustica/Mesas/repository/ServiceMesas.dart';
// import 'package:rustica/Platos/repository/ServicePlatos.dart';
// import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
// import 'package:http/http.dart' as http;
// import 'package:rustica/Mesas/ui/screen/ViewMesas.dart';

// class DetallePlato extends StatefulWidget {
//   @override
//   DetallePlatoState createState() => DetallePlatoState();
// }

// class DetallePlatoState extends State<DetallePlato> {
//   ServicePlatos serviceMesas = ServicePlatos();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColoresApp.fondoBlanco,
//         body: Container(
//           child: FutureBuilder(
//               future: serviceMesas.,            
//               builder: (BuildContext context,
//                   AsyncSnapshot<ResponseMesas> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   // ignore: prefer_const_constructors
//                   return Center(
//                     child: const CircularProgressIndicator(),
//                   );
//                 } else {
//                   print(snapshot.data!.success);
//                   return ListaMesas(snapshot.data!.data);
//                 }
//               }),
//         ));
//   }
// }

// class ListaMesas extends StatelessWidget {
//   final List<MiMesa> mesas;
//   ListaMesas(this.mesas);
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: mesas.length,
//         itemBuilder: (BuildContext context, int index) {
//           final mismesas = mesas[index];
//           return ListTile(
//             title: Container(
//                 child: Column(
//               children: [
//                 VistaMesas(
//                     id: mismesas.id,
//                     num_sillas: mismesas.numSillas,
//                     estado: mismesas.estado,
//                     piso: mismesas.piso)
//               ],
//             )),
//           );
//         });
//   }
// }
