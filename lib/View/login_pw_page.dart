import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rustica/Model/db/API-RSU.dart';
import 'package:rustica/Model/db/ServiceApiLogin.dart';
import 'package:rustica/View/Usuario/dashboard.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/atomic-design/atomos/Logos.dart';
import 'package:rustica/View/login_pw_page.dart';
import 'package:rustica/View/pantalla_registro.dart';
import 'package:http/http.dart' as http;
import 'package:rustica/Model/db/User.dart';



class ForgotPasswordPage extends StatefulWidget{
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose(){

    _emailController.dispose();
    super.dispose();
  }

Future passwordRecovery() async{

  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Recuperacion de Cuenta"),
        backgroundColor: ColoresApp.fondoNaranja,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
                'Ingresa tu Email y te enviaremos tu contraseña',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
              ),
          ),
          SizedBox(height:10),
          //email textfirl
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Ingresar Email',
                fillColor: Colors.black,
                filled: true,
              ),
            ),
          ),
          SizedBox(height:10),
          MaterialButton(
              onPressed: passwordRecovery ,
          child: Text('Recuperar Password'),
          color: Colors.deepPurple[200],
          ),
        ],
      ),
    );
  }
}