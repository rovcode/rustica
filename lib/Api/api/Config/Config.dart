// ignore: file_names

import 'package:rustica/Api/api/dominio/casos_de_uso/casoUso.dart';
import 'package:rustica/Api/api/infraestructura/api/api.dart';

class UseCaseConfig {
  late CasoUso caso_uso;
  late Api api;
  UseCaseConfig (){
    api = Api();
    caso_uso = CasoUso(api) ;
  }
}
