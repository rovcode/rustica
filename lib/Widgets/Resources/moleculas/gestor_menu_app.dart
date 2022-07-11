import 'package:flutter/material.dart';
import 'package:rustica/Reservas/ui/screen/paymentez.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:rustica/Usuarios/ui/screen/pantalla_login.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Widgets/Resources/Models/perfil.dart';
import 'package:rustica/Widgets/Resources/Models/nosotros.dart';
import 'package:rustica/Widgets/Resources/Models/insumo.dart';
import 'package:rustica/Widgets/Resources/Models/notificacion.dart';
import 'package:rustica/Widgets/Resources/Models/about.dart';
import 'package:rustica/Widgets/Resources/VistaApi.dart';


class GestorMenuApp extends StatefulWidget {
  //final int tipousuarios;
  final Usuario Usuariodata;

  GestorMenuApp({required this.Usuariodata});
  @override
  // ignore: no_logic_in_create_state
  GestorMemnuAppState createState() => GestorMemnuAppState(tipo: Usuariodata);
}

class GestorMemnuAppState extends State<GestorMenuApp> {
  //final int tipo;
  final Usuario tipo;
  GestorMemnuAppState({required this.tipo});
  @override
  Widget build(BuildContext context) {
     return tipoMenu(tipo.rol_id);
  }

  Widget tipoMenu(int id) {
    Widget widget;
    switch (id) {
      case 2:
        widget = Column(children: [
          opcionMenu(icon: Icons.home, nombre: "Dashboard",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.table_bar, nombre: "Mesas",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.delivery_dining, nombre: "Mis Pedidos",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
           opcionMenu(icon: Icons.home, nombre: "Realizar Pago",onTap: () =>{Navigator.push(context, MaterialPageRoute(builder: (context) => Pasarela()))}),
          opcionMenu(icon: Icons.food_bank, nombre: "Platos",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.settings, nombre: "Configuración",onTap: _onButtonPressed ),
           Container(
              margin: EdgeInsets.all(20),
             child: FlatButton(
                    color: ColoresApp.fondoNegro ,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: Row(children: [
                      Icon(Icons.exit_to_app),
                      Text("Cerrar Sesión",style: TextStyle(color: ColoresApp.fondoBlanco),)
                    ]),
                  ),
           )
          ]);
        break;
      case 1:
        widget =  Column(children: [
          opcionMenu(icon: Icons.home, nombre: "Dashboard",onTap: () =>{Navigator.push(context, MaterialPageRoute(builder: (context) => VistaApi()))}),
          opcionMenu(icon: Icons.file_copy_sharp, nombre: "Facturas",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.monetization_on, nombre: "Ventas",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.stop, nombre: "Productos",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.account_box_outlined, nombre: "Trabajadores",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.online_prediction, nombre: "En tiempo real",onTap: () =>{/*Navigator.pushReplacementNamed(context, MyHomePage=>()):*/}),
          opcionMenu(icon: Icons.settings, nombre: "Configuración",onTap: _onButtonPressed),
           Container(
              margin: EdgeInsets.all(20),
             child: FlatButton(
                    color: ColoresApp.fondoNegro ,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: Row(children: [
                      Icon(Icons.exit_to_app),
                      Text("Cerrar Sesión",style: TextStyle(color: ColoresApp.fondoBlanco),)
                    ]),
                  ),
           )
          ]);
        break;
      default:
        widget = Container();
    }
    return widget;
  }
  //Creamos el Item del menuVertical
  Widget opcionMenu(
      {IconData? icon, String? nombre, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: ColoresApp.darkPrimary,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              nombre!,
              style: TextStyle(color: ColoresApp.darkPrimary),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
  void _onButtonPressed(){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            color: Color(0xFF747475),
            height: 170,
            child: Container(
              child :ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildBottomNavigationMenu(tipo.rol_id),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                ),

              ),
            ),
          );
        });
  }

  Widget _buildBottomNavigationMenu(int id) {

    Widget widget2;
    final Notifications;
    switch (id) {
      case 2:
        widget2 = Column(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.accessibility_new),
                title: Text('Perfil'),
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(data:tipo)))  }
            ),
           /* ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Notificación'),

            ),*/
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Acerca de Nosotros'),
              onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Nosotros(data:tipo)))  }

            ),
            ListTile(
                leading: Icon(Icons.assessment),
                title: Text('About'),
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> About(data:tipo)))  }

            ),
          ],
        );
        break;
      case 1:
        widget2 =  Column(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.accessibility_new),
                title: Text('Perfil'),
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(data:tipo)))  }
            ),
            /*
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('Notificación'),

            ),*/
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Acerca de Nosotros'),
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Nosotros(data:tipo)))  }

            ),
            ListTile(
              leading: Icon(Icons.add_business),
              title: Text('Insumos'),
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Nosotros(data:tipo) ))  }

            ),
            ListTile(
                leading: Icon(Icons.assessment),
                title: Text('About'),
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> About(data:tipo)))  }

            ),
          ],
        );
        break;
      default:
        widget2 = Container();
    }
    return widget2;
  }
}
