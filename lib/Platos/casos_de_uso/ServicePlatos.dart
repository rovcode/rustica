import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:rustica/Platos/repository/ResponsePlatos.dart';
import 'package:rustica/Platos/repository/endpoints.dart';

class ServicePlatos {
  ServicePlatos();
  final Dio _dio = Dio();
  EndpointsPlatos repository = EndpointsPlatos();
//Traer datos delmesas
  Future<ResponsePlatos> getPlatosApi() async {
    final response = await http.get(repository.recursoPlatos());
    return responsePlatosFromJson(response.body);
  }

  Future<ResponsePlatos> getDetallesPlatosApi(int id) async {
    final response =
        await http.get(repository.recursoDetallesPlato() + id.toString());
    return responsePlatosFromJson(response.body);
  }
}
