// ignore: camel_case_types
class ROUTEAPI{
  // ignore: non_constant_identifier_names
  final ROUTE_BASE_API = "http://api-rsu.herokuapp.com/api/";
  //Creamos una funcion para definir el punto de enlace al servicio de datos, para consumir desde el reposiroy
   getRouteApi(String endpoint){
     return ROUTE_BASE_API.toString()+endpoint;
   }
}