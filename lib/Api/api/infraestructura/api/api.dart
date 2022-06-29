import 'dart:convert';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import "package:http/http.dart" as  http;
import 'package:rustica/Api/api/dominio/models/Recurso.dart';
import 'package:rustica/Api/api/dominio/models/clases_abstractas/abstractas.dart';
import 'package:rustica/Api/api/infraestructura/api/maps/JsonMapper.dart';

class  Api extends GetAbstractaClase {
  JsonMapper _apiMapper = JsonMapper();
  @override
  Future<List<Recurso>> getAll() async {
    final response = await http.get('http://api-rsu.herokuapp.com/api/mesas/');
    if (response.statusCode == 200){
      return  _apiMapper.fromMap (jsonDecode( response.body));
    }else {
      throw Exception('Fue imposible adquirir esta url');
    } 
  }
  @override
  Future<Recurso> getByID(String id) async{
    sleep(Duration(seconds: 4));
    final response = await http.get('http://api-rsu.herokuapp.com/api/detallesmesa/'+id);
    if (response.statusCode == 200){
      return  _apiMapper.fromMap (jsonDecode( response.body));
    }else {
      throw Exception('Fue imposible adquirir esta url');
    } 
  }
}