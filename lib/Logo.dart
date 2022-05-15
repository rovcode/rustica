import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  String logoPath = "assets/img/logorustica.png";
  Logo(this.logoPath); //Constructor
  @override
  Widget build(BuildContext context) {
    final logo = Container(
      margin: EdgeInsets.only(top: 50.00, left: 150),
      width: 200.00,
      height: 200.00,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(logoPath),
      )),
    );
    return Column(
      children: <Widget>[
        logo,
      ],
    );
  }
}
