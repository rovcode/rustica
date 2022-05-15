// ignore_for_file: prefer_const_constructors, duplicate_ignore, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:rustica/const.dart';

class Logo extends StatelessWidget {
  String logoPath = "assets/img/logorustica.png";
  Logo(this.logoPath); //Constructor
  @override
  Widget build(BuildContext context) {
    final logo = Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.only(top: 150.00, left: 100),
      width: 200.00,
      height: 200.00,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(logoPath),
      )),
    );
    //===================================================
    // ignore: avoid_unnecessary_containers
    final SloganTexto = Container(
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
      Padding(
        padding: EdgeInsets.only(
            left: 120,
            bottom: 20,
            right: 20,
            top: 20), //apply padding to all four sides
        // ignore: prefer_const_constructors
        child: Text("Rápido y facil"),
      ),
    ]));
    //===================================================

    final btnQRCode = Container(
        // ignore: prefer_const_literals_to_create_immutables
        margin: const EdgeInsets.only(top: 25, left: 120),
        child: Column(children: [
          RaisedButton(
            child: Text("Escanear QR Code"),
            color: Color(0xffffa900),
            onPressed: () {
              print("ok");
            },
          ),
        ]));
    //===================================================
    return Column(
      children: <Widget>[logo, SloganTexto, btnQRCode],
    );
  }
}
