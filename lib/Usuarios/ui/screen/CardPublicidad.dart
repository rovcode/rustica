
import 'package:flutter/material.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';

class CardPublicidad extends StatelessWidget {
  var _name;
  var _description;
  var _imageUrl;
  var _bgColor;

  CardPublicidad(this._name, this._description, this._imageUrl, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
            
        //   ),
        // );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(_imageUrl),),
            title: Text(
              _name,
              style: TextStyle(
                color: ColoresApp.darkPrimary,
                fontWeight: FontWeight.bold,
                fontSize:15
              ),
            ),
            subtitle: Text(
              _description,
              style: TextStyle(
                color: ColoresApp.darkPrimary.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}