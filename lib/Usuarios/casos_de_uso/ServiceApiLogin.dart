// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIServiceLogin {
  final String email;
  final String pass;

  APIServiceLogin(this.email, this.pass);
  Future<String> future = Future(() => "Latest News");

  Future<String?> login() async {
    if (email.isNotEmpty && pass.isNotEmpty) {
      final response = await http.post(
          Uri.parse("http://api-rsu.herokuapp.com/api/login"),
          body: ({'email': email, 'password': pass}));
      if (response.statusCode == 200) {
        //return jsonDecode(utf8.decode(response.bodyBytes));
        return response.body;
      } else {
        print("Credenciales erroneas");
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Credenciales incorrectas", style: TextStyle(color: ColoresApp.darkPrimary),)));
      }
    } else {
      return "VACIO";
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ingrese valores", style: TextStyle(color: ColoresApp.darkPrimary),)));
    }
  }
}
