import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:rustica/Api/db.dart';
import 'package:rustica/Mesas/repository/ResponseMesas.dart';
import 'package:http/http.dart' as http;
class ServiceMesas {
  ServiceMesas();
  final Dio _dio = Dio();
  // final url = "http://api-rsu.herokuapp.com/api/login";
  Recurso url = Recurso();
//Traer datos delmesas
  Future<ResponseMesas> getMesasApi() async {
    final response = await http.get('http://api-rsu.herokuapp.com/api/mesas');
    return responseMesasFromJson(response.body);
  }
  //Registrar Mesas
    Future<Response> registrarMesas(Map<String, dynamic>? datosmesa) async {
    try {
      Response response = await _dio.post(url.recursoRegistrarMesas(),
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
 