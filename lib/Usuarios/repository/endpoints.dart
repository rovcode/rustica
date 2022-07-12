import 'package:rustica/infraestructura/base.dart';

class EndpointsUsuario {
   //Instanciamos nuestra ruta base
  ROUTEAPI rutaApi = ROUTEAPI();
  /*______________________Usuarios_______________________________ */
  String recursoLogin() {
    return rutaApi.getRouteApi("login");
  }

  String recursoRegistro() {
    return rutaApi.getRouteApi("registrar");
  }

  String recursoUsuarios() {
    return rutaApi.getRouteApi("usuarios");
  }

  String recursoRols() {
    return rutaApi.getRouteApi("roles");
  }

  String recursoUrsurio() {
    return rutaApi.getRouteApi("usuario/");
  }

}