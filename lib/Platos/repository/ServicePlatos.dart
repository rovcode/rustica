import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:rustica/Api/db.dart';
import 'package:rustica/Platos/repository/ResponsePlatos.dart';


class ServicePlatos {
  ServicePlatos();
  final Dio _dio = Dio();
  // final url = "http://api-rsu.herokuapp.com/api/login";
  Recurso url = Recurso();
//Traer datos delmesas
  Future<ResponsePlatos> getPlatosApi() async {
    final response = await http.get('http://api-rsu.herokuapp.com/api/platos');
    //print(response.body);
    return responsePlatosFromJson(response.body);
  }
}