import 'package:flutter/material.dart';
import 'package:rustica/Model/db/API-RSU.dart';
import 'package:rustica/View/Usuario/dashboard.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/atomic-design/atomos/Logos.dart';
import 'package:dio/dio.dart';
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
        child: SingleChildScrollView(child:  Form( 
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
    Future<void> registrarUsuario() async{
       if(_formKey.currentState!.validate()){
        // ignore: prefer_const_constructors
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:  const Text(
            "Registrando..",
            style: TextStyle(color: Colors.white),),
            backgroundColor: ColoresApp.fondoNaranja,
        ));
        //obtenemos los valores ingresados por el usuario
        var csrf = "mBsiZ60X0ZlmCFthV8pITkwfE5ElzQyoQ2A8H3kA"; 
         Map<String, dynamic> datosUsuario ={
            "name":txtnombre.text,
            "phone":txttelefono.text,
            "email":[{"value": txtcorreo.text}], 
            "password": txtpassword.text,
            "rol_id":2,
            "csrfmiddlewaretoken" : csrf
         };
          ApiRSU _apiUsurio = ApiRSU();
         dynamic response = await _apiUsurio.registerUser(datosUsuario,
          
         );
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (response.statusCode == 200) {
        print(response.data);
        if (response.data['mensaje'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
              'Error en credenciales...',
              style: TextStyle(color: Colors.red),
            ),
            backgroundColor: ColoresApp.fondoBlanco,
          ));
          print("error credenciales");
        } else {
          // ignore: prefer_const_constructors
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
              'Bienvenido!!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          print("ok");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        }
        //print(res.data['user']['id']);
      } else {
        print("error");
        print(response.statusCode);
      }
       }
    }
}
