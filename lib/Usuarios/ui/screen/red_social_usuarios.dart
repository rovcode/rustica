import 'package:flutter/material.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
class RedSocial extends StatefulWidget {
  @override
  RedSocialState createState() => RedSocialState();
}

class RedSocialState extends State<RedSocial> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Red Social usuarios", style: TextStyle(color: ColoresApp.darkPrimary),),
    );
  }
}