//@dart=2.9
import 'package:flutter/material.dart';
import 'package:rustica/ui/atomic-design/moleculas/menu_vertical.dart';
import 'package:rustica/ui/view/pantalla_chatbot.dart';
import 'package:rustica/ui/view/pantalla_principal.dart';
import 'package:rustica/ui/atomic-design/tokens/ColoresApp.dart';

void main() {
  runApp(RusticaApp());
}

class RusticaApp extends StatelessWidget {
  //const RusticaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Rustica Restaurante',
      debugShowCheckedModeBanner: false,
      theme: ColoresApp.darkTheme,
      darkTheme: ColoresApp.darkTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 // const MyHomePage({Key? key}) : super(key: key);
  //inal String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
