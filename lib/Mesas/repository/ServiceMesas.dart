import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rustica/Api/db.dart';

class ServiceMesas {
  ServiceMesas();
  final Dio _dio = Dio();
  // final url = "http://api-rsu.herokuapp.com/api/login";
  Recurso url = Recurso();
//Traer datos delmesas
  Future<Response> getMesas() async {
    try {
      Response response = await _dio.get(url.recursoMesas());
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }

  }
}
