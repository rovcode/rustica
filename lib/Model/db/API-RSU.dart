import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rustica/Model/db/User.dart';
import 'package:rustica/Model/db/db.dart';

class ApiRSU {
  final Dio _dio = Dio();
  // final url = "http://api-rsu.herokuapp.com/api/login";
  Recurso url = Recurso();
  //Registro usuario
  Future<Response> registerUser(Map<String, dynamic>? datosUsuario) async {
    try {
      Response response = await _dio.post(url.recursoRegistro(),
          data: datosUsuario,
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

  //Login del usuario
  Future iniciarSesion(String correo, String pass) async {
    try {
      Response response = await _dio.post(
        url.recursoLogin(),
        data: {'email': correo, 'password': pass},
      );
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

//Traer datos del usuario
  Future<Response> getUserProfileData(String accesstoken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }

    // Future<Response> cerrarSesion() async {
    //     //IMPLEMENT USER LOGOUT
    //  }
  }
}
