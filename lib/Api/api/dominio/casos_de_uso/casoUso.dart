

import 'package:rustica/Api/api/dominio/models/Recurso.dart';
import 'package:rustica/Api/api/dominio/models/clases_abstractas/abstractas.dart';

class CasoUso{
   final GetAbstractaClase _clase_abstracta;
  CasoUso(this._clase_abstracta);
   Future<Recurso> getByID(String id) async{
     return this._clase_abstracta.getByID(id);
   }
   Future<List<Recurso>> getAll() async{
     return this._clase_abstracta.getAll();
   }
}