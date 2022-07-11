import 'package:rustica/Api/base.dart';

class EndpointsPlatos{
    ROUTEAPI rutaApi = ROUTEAPI();
    
  /*______________________Platos_______________________________ */
  String recursoPlatos() {
    return rutaApi.getRouteApi("platos");
  }

  String recursoDetallesPlato() {
    return rutaApi.getRouteApi("detallesplato/");
  }
}