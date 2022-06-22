
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';

class CategoriasRustica extends StatelessWidget {
  var _title;
  var _imageUrl;
  var _bgColor;

  CategoriasRustica(this._title, this._imageUrl, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    
      width: 130,
      height: 160,
      child: Stack(

        children: <Widget>[
          Card(  
            color: ColoresApp.fondoBlanco,      
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 120,
              height: 137,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _title,
                  style: TextStyle(
                    color: ColoresApp.fondoNegro,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 84,
              width: 84,
              decoration: BoxDecoration(
                color: _bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(_imageUrl,),
            ),
          ),
        ],
      ),
    );
  }
}