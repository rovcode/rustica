class Recurso {
  Recurso();
  /*______________________Usuarios_______________________________ */
  String recursoLogin() {
    return "http://api-rsu.herokuapp.com/api/login";
  }
   String recursoRegistro() {
    return "http://api-rsu.herokuapp.com/api/registrar";
  }
  String recursoUsuarios() {
    return "http://api-rsu.herokuapp.com/api/usuarios";
  }
   String recursoRols() {
    return "http://api-rsu.herokuapp.com/api/roles";
  }
    String recursoUrsurio() {
    return "http://api-rsu.herokuapp.com/api/usuario/";
  }
  /*______________________Mesas_______________________________ */
    String recursoMesas() {
      return "http://api-rsu.herokuapp.com/api/mesas/";
    }
    String recursoRegistrarMesas() {
      return "http://api-rsu.herokuapp.com/api/registrarmesa";
    }
    String reservarMesa(id) {
      return "http://api-rsu.herokuapp.com/api/actualizarmesa/"+id.toString();
    }
  /*______________________Platos_______________________________ */
  String recursoPlatos() {
    return "http://api-rsu.herokuapp.com/api/platos";
  }
   String recursoDetallesPlato() {
    return "http://api-rsu.herokuapp.com/api/detallesplato/";
  }
  /*______________________Bebidas_______________________________ */
 

  



 
 

 
}
