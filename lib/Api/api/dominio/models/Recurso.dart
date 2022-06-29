class Recurso {
  // String idMesa;
  // int id;
  // String title;
  // String url;
  // String thumbnailUrl;
  int id;
    int num_sillas;
    String estado;
    String piso;
    DateTime createdAt;
    DateTime updatedAt;
  // Recurso(
  //     {required this.idMesa,
  //     required this.id,
  //     required this.title,
  //     required this.url,
  //     required this.thumbnailUrl}); //Constructor 
    Recurso({
        required this.id,
        required this.num_sillas,
        required this.estado,
        required this.piso,
        required this.createdAt,
        required this.updatedAt,
    });

}
