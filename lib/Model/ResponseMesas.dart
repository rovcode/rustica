// To parse this JSON data, do
//
//     final responseMesas = responseMesasFromJson(jsonString);

import 'dart:convert';

ResponseMesas responseMesasFromJson(String str) => ResponseMesas.fromJson(json.decode(str));

String responseMesasToJson(ResponseMesas data) => json.encode(data.toJson());

class ResponseMesas {
  bool success;
  List<MiMesa> data;
    ResponseMesas({
        required this.success,
        required this.data,
    });

    

    factory ResponseMesas.fromJson(Map<String, dynamic> json) => ResponseMesas(
        success: json["success"],
        data: List<MiMesa>.from(json["data"].map((x) => MiMesa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class MiMesa {
    MiMesa({
        required this.id,
        required this.numSillas,
        required this.estado,
        required this.piso,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int numSillas;
    String estado;
    String piso;
    DateTime createdAt;
    DateTime updatedAt;

    factory MiMesa.fromJson(Map<String, dynamic> json) => MiMesa(
        id: json["id"],
        numSillas: json["num_sillas"],
        estado: json["estado"],
        piso: json["piso"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "num_sillas": numSillas,
        "estado": estado,
        "piso": piso,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
    getid(){
      return id;
    }
}
