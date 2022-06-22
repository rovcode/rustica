import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rustica/Model/db/API-RSU.dart';
import 'package:rustica/Model/db/ServiceApiLogin.dart';
import 'package:rustica/View/Usuario/dashboard.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/atomic-design/atomos/Logos.dart';
import 'package:rustica/View/pantalla_registro.dart';
import 'package:http/http.dart' as http;

import 'package:rustica/Model/db/User.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final txtcorreo = TextEditingController();
  final txtpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: ColoresApp.fondoNaranja,
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Form(
          //1 Form como raiz de nuestro formulario
          key: _formKey,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Logo(),
              _correo(),
              _pass(),
              _boton_inicio_sesion(),
              _boton_registro(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ), //2
            ],
          )),
        )),
      ),
    );
  }

  Widget _correo() {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25),
      width: 350,
      child: TextFormField(
          controller: txtcorreo,
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Ingrese su correo',
            labelText: 'Correo',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Ingrese correo';
            }
          }),
    );
  }

  Widget _pass() {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25),
      width: 350,
      child: TextFormField(
          obscureText: true,
          controller: txtpassword,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock_clock),
            hintText: 'Ingrese su contraseña',
            labelText: 'Contraseña',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Ingrese contraseña';
            }
          }),
    );
  }

  Widget _boton_inicio_sesion() {
    return Container(
        margin: EdgeInsets.only(top: 35),
        child: Center(
            child: SizedBox(
          width: 300,
          height: 50,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30)),
            color: ColoresApp.lightPrimary,
            onPressed: login,
            child: Text('Iniciar Sesión',
                style: TextStyle(
                  color: ColoresApp.darkPrimary,
                )),
          ),
        )));
  }

  Widget _boton_registro() {
    return Container(
        margin: EdgeInsets.only(top: 35),
        child: Center(
          child: Card(
              color: ColoresApp.darkPrimary,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Align(
                    alignment: Alignment.center,
                  ),
                  Text('                  ¿No tienes cuenta?',
                      style: TextStyle(
                        color: ColoresApp.lightPrimary,
                      )),
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
                          MaterialPageRoute(builder: (context) => Registro()),
                        );
                      },
                      child: Text('Registrarme',
                          style: TextStyle(
                            color: ColoresApp.darkPrimary,
                          )),
                    ),
                  )
                ],
              )),
        ));
  }

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Validando...',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColoresApp.fondoNaranja,
      ));
      ApiRSU _apiUsurio = ApiRSU();
      dynamic res = await _apiUsurio.iniciarSesion(
        txtcorreo.text,
        txtpassword.text,
      );
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res.statusCode == 200) {
        if (res.data['mensaje'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
              'Error en credenciales...',
              style: TextStyle(color: Colors.red),
            ),
            backgroundColor: ColoresApp.fondoBlanco,
          ));
          print("error credenciales");
        } else {
          // ignore: prefer_const_constructors
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
              'Bienvenido!!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          
          int id = res.data['user']['id'];
          String name=res.data['user']['name'];
          String phone=res.data['user']['phone'];
          String email=res.data['user']['email'];
          int rol_id=res.data['user']['rol_id'];
          final data = Usuario(id: id, name:name, phone: phone, email: email, rol_id: rol_id);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(data:data)));
         
        }
        //print(res.data['user']['id']);
      } else {
        print("error");
      }
    }
  }
}
