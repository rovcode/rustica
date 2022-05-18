// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

class PantallPrincipal extends StatelessWidget {
  String logoPath = "assets/img/logorustica.png";
  PantallPrincipal(this.logoPath); //Constructor
  @override
  Widget build(BuildContext context) {
    Widget Logo_Rustica() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 150),
          child: Column(
            children: [Image(image: AssetImage(logoPath))],
          ),
        ),
      );
    }

    //===================================================
    // ignore: avoid_unnecessary_containers
    Widget TextoPantallaPrincipal() {
      return Center(
          child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 40),
        child: Text(
          "Rápido y fácil",
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
    //===================================================

    Widget ButtonQRCode() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              RaisedButton(
                child: new Text(
                  "Escaner QR",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                // ignore: unnecessary_new
                shape: new RoundedRectangleBorder(
                    // ignore: unnecessary_new
                    borderRadius: new BorderRadius.circular(30)),
                color: Color(0xffffa900),
                onPressed: () {
                  print("ok");
                },
              ),
            ],
          ),
        ),
      );
    }

    //===================================================
    Widget ButtonLogin() {
      return Center(
        child: Column(children: [
          RaisedButton(
              child: new Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.white,
              onPressed: () {
                print("Login");
              }),
        ]),
      );
    }

    //==================================================
    return Column(
      children: <Widget>[
        Logo_Rustica(),
        TextoPantallaPrincipal(),
        ButtonQRCode(),
        ButtonLogin()
      ],
    );
  }
}
