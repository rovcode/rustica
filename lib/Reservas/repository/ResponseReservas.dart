// To parse this JSON data, do
//
//     final responsePlatos = responsePlatosFromJson(jsonString);

import 'dart:convert';

ResponseRerva responsePlatosFromJson(String str) => ResponseRerva.fromJson(json.decode(str));

String responsePlatosToJson(ResponseRerva data) => json.encode(data.toJson());

class ResponseRerva {
  bool success;
  List<Reservas> data;
   ResponseRerva({
     required this.success,
     required this.data,
   });



  factory ResponseRerva.fromJson(Map<String, dynamic> json) => ResponseRerva(
    success: json["success"],
    data: List<Reservas>.from(json["data"].map((x) => Reservas.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Reservas {
    Reservas({
        required this.id,
        required this.mesaid,
        required this.userId,
        required this.estado,
        required this.detalles,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int mesaid;
    int userId;
    String estado;
    String detalles;
    DateTime createdAt;
    DateTime updatedAt;

    factory Reservas.fromJson(Map<String, dynamic> json) => Reservas(
        id: json["id"],
        mesaid: json["mesaid"],
        userId: json["user_id"],
        estado: json["estado"],
        detalles: json["detalles"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mesaid": mesaid,
        "user_id": userId,
        "estado": estado,
        "detalles": detalles,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
