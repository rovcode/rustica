import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rustica/View/pantalla_login.dart';
import 'package:rustica/Model/db/User.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/usuario/dashboard.dart';
import 'package:rustica/Model/db/API-RSU.dart';
import 'package:rustica/View/atomic-design/moleculas/gestor_menu_app.dart';



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
            placeholder: NetworkImage('https://i.pinimg.com/originals/93/94/76/939476f03d23aed679564f0011a8eb42.jpg'),
              image: NetworkImage('https://i.pinimg.com/originals/93/94/76/939476f03d23aed679564f0011a8eb42.jpg')),
          Container(
            alignment: AlignmentDirectional.topStart,
            margin: EdgeInsets.only(top: 50.0, left: 10.0),
            child: GestureDetector(
                onTap: () =>{Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(data:data) ))   },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 40.0
                  ),
          ),
          ),
          Transform.translate(
            offset: Offset(0.0, 500),
            child:_cardProfileInfo()
          )
        ],
      ),
    );
  }

}

Widget _cardProfileInfo(){
  return Container (
    margin: EdgeInsets.symmetric(horizontal: 20.0),
    padding: EdgeInsets.all(20.0),
    height: 320,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white),
    child: Column(
      children: [
        _socialButtons()
      ],
    ),
  );
}

Widget _socialButtons() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://i.pinimg.com/originals/93/94/76/939476f03d23aed679564f0011a8eb42.jpg'),
          radius: 40.0,
        ),
        Transform.translate(
          offset: Offset(-20.0, 30.0),
          child: Icon(
            Icons.check_circle,
          color: Colors.green,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: RaisedButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            color: Colors.white,
            child: Text('ADD FRIEND', style: TextStyle(color: Colors.black)),
          ),
        ),
        RaisedButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: Color.fromRGBO(245, 45, 86, 1.0),
          child: Text('SEGUIR', style: TextStyle(color: Colors.white)),
        )
      ],
    );
}