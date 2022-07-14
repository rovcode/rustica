import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:rustica/Reservas/repository/ResponseReservas.dart';
import 'package:rustica/Reservas/repository/edponits.dart';

class ServiceReservas {
  ServiceReservas();
  final Dio _dio = Dio();
  EndpointsReservas repository = EndpointsReservas();
 
  Future<ResponseRerva> getReservas() async {
    final response = await http.get(repository.recursoReservas());
    return responsePlatosFromJson(response.body);
  }
}