// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [nuestrosPlatod()],
      ),
    );
  }

  //Creamos un card para mostrar los platos principales o promociones
  Card nuestrosPlatod() {
    // Un obj tipo card siempre retorna un Card y como child un ClipRRect
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Image.network(
                  "https://www.saborusa.com/bo/wp-content/uploads/sites/16/2019/11/Calma-tus-antojos-con-deliciosas-y-rapidas-recetas-Foto-destacada.png",
                  fit: BoxFit.fill,
                  height: 200,
                  width: 400),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
                // ignore: avoid_unnecessary_containers
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Row(
                      children: [],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
