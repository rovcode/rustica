
import 'package:rustica/Model/repository/api/dominio/models/Recurso.dart';
import 'package:rustica/Model/repository/api/infraestructura/api/maps/BaseMapper.dart';
//Agregamos los valos dl json
class   JsonMapper implements BaseMapper <Recurso>{
  @override
  fromMap(Map<String, dynamic> json) =>  Recurso(
    idMesa: json['userId'],
    id: json['id'],
    title: json['title'],
    url: json['url'],
    thumbnailUrl: json['thumbnailUrl']
  );
}
