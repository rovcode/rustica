 import 'package:flutter/material.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Usuarios/ui/screen/dashboard.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:splashscreen/splashscreen.dart';
class Splash extends StatelessWidget {
  Usuario user;
  Splash({required this.user});
  @override
  Widget build(BuildContext context) {
     int id = user.id;
     String name=user.name;
     String phone=user.phone;
     String email=user.email;
     int rol_id=user.rol_id;
     final data = Usuario(id: id, name:name, phone: phone, email: email, rol_id: rol_id);
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: Dashboard(data:data),
      title: const Text('Rustica',textScaleFactor: 2,),
      image: Image.asset('assets/img/splash.png'),
      loadingText: const Text("Cargando.."),
      photoSize: 100.0,
      loaderColor: ColoresApp.fondoNaranja,
    );
  }
}