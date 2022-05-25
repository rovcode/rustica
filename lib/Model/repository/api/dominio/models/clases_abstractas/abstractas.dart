import '../Recurso.dart';

abstract class GetAbstractaClase {
  @override
   Future<Recurso> getByID(String id);
   Future<List<Recurso>> getAll();
}