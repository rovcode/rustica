class Platos {
  int id;
  String nombre;
  double precio;
  int starts;
  String detalles;
  Platos(
      {required this.id,
        required this.nombre,
        required this.precio,
        required this.starts,
        required this.detalles,});
  getId(){
    return id;
  }
}