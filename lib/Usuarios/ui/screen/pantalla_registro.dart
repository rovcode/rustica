import 'package:flutter/material.dart';
import 'package:rustica/Usuarios/casos_de_uso/ServiceUsuario.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Usuarios/ui/screen/dashboard.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:rustica/Widgets/Resources/atomos/Logos.dart';
import 'package:dio/dio.dart';
import 'package:rustica/Widgets/Resources/moleculas/GestorSMS.dart';
import 'package:rustica/Widgets/Splash.dart';

class Registro extends StatefulWidget {
  @override
  RegistroState createState() => RegistroState();
}

class RegistroState extends State<Registro> {
  @override
  final _formKey = GlobalKey<FormState>();
  final txtcorreo = TextEditingController();
  final txtnombre = TextEditingController();
  final txttelefono = TextEditingController();
  final txtpassword = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        backgroundColor: ColoresApp.fondoNaranja,
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Form(
          //1 Form como raiz de nuestro formulario
          key: _formKey,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Logo(),
              _correo(),
              _pass(),
              _telefono(),
              _nombre(),
              _boton_registro(),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ), //2
            ],
          )),
        )),
      ),
    );
  }

  Widget _correo() {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25),
      width: 350,
      child: TextFormField(
          controller: txtcorreo,
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Ingrese su correo',
            labelText: 'Correo',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Ingrese correo';
            }
          }),
    );
  }

  Widget _nombre() {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25),
      width: 350,
      child: TextFormField(
          controller: txtnombre,
          decoration: const InputDecoration(
            icon: Icon(Icons.article),
            hintText: 'Ingrese su nombre',
            labelText: 'Nombre',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Ingrese nombre';
            }
          }),
    );
  }

  Widget _pass() {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25),
      width: 350,
      child: TextFormField(
          controller: txtpassword,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock_clock),
            hintText: 'Ingrese su contraseña',
            labelText: 'Contraseña',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Ingrese contraseña';
            }
          }),
    );
  }

  Widget _telefono() {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25),
      width: 350,
      child: TextFormField(
          controller: txttelefono,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock_clock),
            hintText: 'Ingrese su telefono',
            labelText: 'Telefono',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Ingrese telefono';
            }
          }),
    );
  }

  Widget _boton_registro() {
    return Container(
        margin: EdgeInsets.only(top: 35),
        child: Center(
          child: Card(
              color: ColoresApp.darkPrimary,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Align(
                    alignment: Alignment.center,
                  ),
                  Text('                  ¿No tienes cuenta?',
                      style: TextStyle(
                        color: ColoresApp.lightPrimary,
                      )),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30)),
                      color: ColoresApp.lightPrimary,
                      onPressed: registrarUsuario,
                      child: Text('Registrarme',
                          style: TextStyle(
                            color: ColoresApp.darkPrimary,
                          )),
                    ),
                  )
                ],
              )),
        ));
  }

  //Creamos el Future registrar
  Future<void> registrarUsuario() async {
    if (_formKey.currentState!.validate()) {
      // ignore: prefer_const_constructors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          "Registrando..",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColoresApp.fondoNaranja,
      ));
      //obtenemos los valores ingresados por el usuario
      Map<String, dynamic> datosUsuario = {
        "name": txtnombre.text,
        "phone": txttelefono.text,
        "email": txtcorreo.text,
        "password": txtpassword.text,
        "rol_id": 2
      };
      ServiceUsuario _apiUsurio = ServiceUsuario();
      dynamic res = await _apiUsurio.registerUser(datosUsuario);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res.statusCode == 200) {
        if (res.data['mensaje'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
              'Error en registro...',
              style: TextStyle(color: Colors.red),
            ),
            backgroundColor: ColoresApp.fondoBlanco,
          ));
        } else {
          // ignore: prefer_const_constructors
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
              'Bienvenido!!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          int id = res.data['user']['id'];
          String name = res.data['user']['name'];
          String phone = res.data['user']['phone'];
          String email = res.data['user']['email'];
          int rol_id = res.data['user']['rol_id'];
          final data = Usuario(
            id: id,
            name: name,
            phone: phone,
            email: email,
            rol_id: rol_id,
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Splash(user: data)));
          //GestorSMS gestionSMS =  GestorSMS(numerocliente: phone);
        }
        //print(res.data['user']['id']);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            'Este usuario ya se registró anteriormente',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: ColoresApp.fondoBlanco,
        ));
      }
    }
  }
}
