
import 'package:rustica/Model/repository/api/dominio/models/Recurso.dart';
import 'package:rustica/Model/repository/api/infraestructura/api/maps/BaseMapper.dart';
//Agregamos los valos dl json
class   JsonMapper implements BaseMapper <Recurso>{
  @override
  fromMap(Map<String, dynamic> json) =>  Recurso(
     id: json["id"],
        num_sillas: json["num_sillas"],
        estado: json["estado"],
        piso: json["piso"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
  );
}
