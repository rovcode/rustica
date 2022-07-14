class Reserva {
    Reserva({
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

    factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
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
