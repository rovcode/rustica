// To parse this JSON data, do
//
//     final responsePlatos = responsePlatosFromJson(jsonString);

import 'dart:convert';

ResponsePlatos responsePlatosFromJson(String str) => ResponsePlatos.fromJson(json.decode(str));

String responsePlatosToJson(ResponsePlatos data) => json.encode(data.toJson());

class ResponsePlatos {
  bool success;
  List<MisPlatos> data;
   ResponsePlatos({
     required this.success,
     required this.data,
   });



  factory ResponsePlatos.fromJson(Map<String, dynamic> json) => ResponsePlatos(
    success: json["success"],
    data: List<MisPlatos>.from(json["data"].map((x) => MisPlatos.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MisPlatos {
  MisPlatos({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.starts,
    required this.detalles,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nombre;
  String precio;
  int starts;
  String detalles;
  DateTime createdAt;
  DateTime updatedAt;

  factory MisPlatos.fromJson(Map<String, dynamic> json) => MisPlatos(
    id: json["id"],
    nombre: json["nombre"],
    precio: json["precio"],
    starts: json["starts"],
    detalles: json["detalles"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "precio": precio,
    "starts": starts,
    "detalles": detalles,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
  getid(){
    return id;
  }
}