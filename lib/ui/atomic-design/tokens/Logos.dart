import 'package:flutter/material.dart';

class Logo extends StatelessWidget{
String logoPath = "assets/img/logorustica.png";
  @override
  @override
  Widget build(BuildContext context) {
    return Logo_Rustica();
  }
   Widget Logo_Rustica() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [Image(image: AssetImage(logoPath))],
          ),
        ),
      );
    }

}
