import 'package:flutter/material.dart';
import 'package:rustica/Model/db/User.dart';
import 'package:rustica/View/Usuario/WidgetApi.dart';
import 'package:rustica/Model/db/API-RSU.dart';
import 'package:rustica/View/Usuario/dashboard.dart';
class About extends StatelessWidget{
  final Usuario data;
  About({required this.data});



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
          )




        ],
      ),
    );
  }

}