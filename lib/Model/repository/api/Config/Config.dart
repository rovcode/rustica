// ignore: file_names
import 'package:rustica/Model/repository/api/dominio/casos_de_uso/casoUso.dart';
import 'package:rustica/Model/repository/api/infraestructura/api/api.dart';

class UseCaseConfig {
  late CasoUso caso_uso;
  late Api api;
  UseCaseConfig (){
    api = Api();
    caso_uso = CasoUso(api) ;
  }
}
