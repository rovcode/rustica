import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rustica/Usuarios/ui/screen/dashboard.dart';
import 'package:rustica/Usuarios/ui/screen/pantalla_login.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:rustica/Usuarios/repository/API-RSU.dart';
import 'package:rustica/Widgets/Resources/moleculas/gestor_menu_app.dart';



class Profile extends StatelessWidget{
  final Usuario data;
  Profile({required this.data});



  @override
  Widget build (BuildContext context){
    return Scaffold (
      body: Stack(

        children: [
          FadeInImage(
            fit: BoxFit.cover,
            height: double.infinity,
            placeholder: NetworkImage('https://images.unsplash.com/photo-1611457194403-d3aca4cf9d11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'),
              image: NetworkImage('https://images.unsplash.com/photo-1611457194403-d3aca4cf9d11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80')),
          Container(
            alignment: AlignmentDirectional.topStart,
            margin: EdgeInsets.only(top: 50.0, left: 10.0),
            child: GestureDetector(
                onTap: () =>{Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(data:data) ))   },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.orange,
                    size: 40.0
                  ),
          ),
          ),
          Transform.translate(
            offset: Offset(0.0, 500),
            child:_cardProfileInfo(data.name,data.email)
          )
        ],
      ),
    );
  }

}

Widget _cardProfileInfo(String nombre, String correo){
  return Container (
    margin: EdgeInsets.symmetric(horizontal: 20.0),
    padding: EdgeInsets.all(20.0),
    height: 320,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _socialButtons(),
        SizedBox(height: 6.0),
        _headers(nombre, Colors.black, 24.0),
        SizedBox(height: 4.0),
        _headers(correo, Color.fromRGBO(42, 44, 49, 1.0), 14.0),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            'Soy un usuario de testeo para este caso de perfil',
            style: TextStyle(
              color: Color.fromRGBO(42, 44, 49, 1.0),
              fontWeight: FontWeight.w500,
              fontSize: 15.0)),
        ),
        _stats()
      ],
    ),
  );
}

Widget _socialButtons() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1611457194403-d3aca4cf9d11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'),
          radius: 40.0,
        ),
        Transform.translate(
          offset: Offset(-20.0, 30.0),
          child: Icon(
            Icons.check_circle,
          color: Colors.green,
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: 10.0),
          /*child: RaisedButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            color: Colors.white,
            child: Text('ADD FRIEND', style: TextStyle(color: Colors.black)),
          ),*/
        ),
  /*RaisedButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: Color.fromRGBO(245, 45, 86, 1.0),
          child: Text('SEGUIR', style: TextStyle(color: Colors.white)),
        )*/
      ],
    );
}
Widget _headers(String texto, Color color, double fontSize){
  return Text ( texto,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: fontSize));
}

Widget _stats(){
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    height: 70.0,
    decoration: BoxDecoration(
      color:Colors.white,
      border: Border.symmetric(
        horizontal: BorderSide(
          color: Color.fromRGBO(245,245,245,1.0)))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
         children: [
           Center(
                 child: Text(
                     'SEGUIDORES',
                     style: TextStyle(
                       color: Color.fromRGBO(42, 44, 49, 1.0),
                       fontSize: 10.0,
                       fontWeight: FontWeight.normal),
                 ),
           ),
           SizedBox(
               height: 6.0),
           Center(
             child: Text(
               '2318',
               style: TextStyle(
                   color: Colors.black,
                   fontSize: 20.0,
                   fontWeight: FontWeight.w600),
             ),
           ),
         ],
        ),
        SizedBox(
            width: 40.0),
        Column(
          children: [
            Center(
              child: Text(
                'FRIENDS',
                style: TextStyle(
                    color: Color.fromRGBO(42, 44, 49, 1.0),
                    fontSize: 10.0,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
                height: 6.0),
            Center(
              child: Text(
                '128',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        )
      ],
    ),
  );
}