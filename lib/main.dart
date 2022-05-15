import 'package:flutter/material.dart';
import 'package:rustica/Logo.dart';
import 'package:rustica/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rustica Restaurante',
      debugShowCheckedModeBanner: false,
      theme: ColoresApp.darkTheme,
      darkTheme: ColoresApp.darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  //inal String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Logo("assets/img/logorustica.png"),
      
      
    );
  }
}
