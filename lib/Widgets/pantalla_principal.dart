// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:rustica/Usuarios/ui/screen/QRScanner.dart';


import '../Usuarios/ui/screen/pantalla_login.dart';

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
      return Container(
          margin: EdgeInsets.only(top: 35),
          child: Center(
            child: Card(
                color: ColoresApp.darkPrimary,
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 0,
                  runSpacing: 20,
                  children: [
                    Align(
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: ColoresApp.fondoNaranja,
                        onPressed: () {},
                        child: Text('Iniciar con huella',
                            style: TextStyle(
                              color: ColoresApp.lightPrimary,
                            )),
                      ),
                    )
                  ],
                )),
          ));
    }

    //===================================================

    // ignore: non_constant_identifier_names
    Widget ButtonLogin() {
      return Container(
          margin: EdgeInsets.only(top: 35),
          child: Center(
            child: Card(
                color: ColoresApp.darkPrimary,
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 0,
                  runSpacing: 20,
                  children: [
                    Align(
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30)),
                        color: ColoresApp.lightPrimary,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text('Login',
                            style: TextStyle(
                              color: ColoresApp.darkPrimary,
                            )),
                      ),
                    )
                  ],
                )),
          ));
    }

    //==================================================
    return Column(
      children: <Widget>[
        Logo_Rustica(),
        TextoPantallaPrincipal(),
        ButtonQRCode(),
        ButtonLogin(),
      ],
    );
  }
}
