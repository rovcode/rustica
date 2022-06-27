//@dart=2.9
import 'package:flutter/material.dart';
import 'package:rustica/View/Usuario/plato_detalle4.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/pantalla_chatbot.dart';
import 'package:rustica/View/pantalla_principal.dart';
import 'package:rustica/View/pantalla_login.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();//Inicia Firebase
  //Firebase.initializeApp();//Cargamos metodo proncipal
  runApp(RusticaApp());
 
}

class RusticaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rustica Restaurante',
      debugShowCheckedModeBanner: false,
      theme: ColoresApp.darkTheme,
      darkTheme: ColoresApp.darkTheme,
      home: NucleoApp(),
    );
  }
}

class NucleoApp extends StatefulWidget {
  @override

 State<NucleoApp> createState() => NucleoAppState();
}

class NucleoAppState extends State<NucleoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PantallPrincipal("assets/img/logorustica.png"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatBot()),
          );
        },
        tooltip: 'Chatbot',
        backgroundColor: ColoresApp.fondoNaranja,
        child: const Icon(Icons.message),
      ),
    );
  }
}
