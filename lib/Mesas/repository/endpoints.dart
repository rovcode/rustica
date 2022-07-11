import 'package:rustica/Api/base.dart';

class EdnpointsMesas {
  ROUTEAPI rutaApi = ROUTEAPI();
  String recursoMesas() {
    return rutaApi.getRouteApi("mesas");
  }
  String recursoRegistrarMesas() {
    return rutaApi.getRouteApi("registrarmesa");
  }

  String reservarMesa(id) {
    return rutaApi.getRouteApi("actualizarmesa/" + id.toString());
  }
}
