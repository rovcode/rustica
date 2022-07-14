import 'package:rustica/infraestructura/base.dart';

class EndpointsReservas{
    ROUTEAPI rutaApi = ROUTEAPI();
    
  /*______________________Reservas_______________________________ */
  String recursoReservas() {
    return rutaApi.getRouteApi("reservas");
  }

  String recursoDetallesRservas() {
    return rutaApi.getRouteApi("detallesreserva/");
  }
}