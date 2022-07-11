import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:rustica/Mesas/repository/ResponseMesas.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:rustica/Mesas/repository/endpoints.dart';

class ServiceMesas {
  ServiceMesas();
  final Dio _dio = Dio();
  EdnpointsMesas repository = EdnpointsMesas();
//Traer datos delmesas
  Future<ResponseMesas> getMesasApi() async {
    final response = await http.get(repository.recursoMesas());
    return responseMesasFromJson(response.body);
  }

  //Registrar Mesas
  Future<Response> registrarMesas(Map<String, dynamic>? datosmesa) async {
    try {
      Response response = await _dio.post(repository.recursoRegistrarMesas(),
          data: datosmesa,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }));
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  //Actualizando estado reservado
  Future<Response> reservarMesa(Map<String, dynamic>? datosmesa, int id) async {
    try {
      Response response = await _dio.post(repository.reservarMesa(id),
          data: datosmesa,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }));
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
