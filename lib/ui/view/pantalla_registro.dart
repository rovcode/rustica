import 'package:flutter/material.dart';
import 'package:rustica/ui/atomic-design/tokens/ColoresApp.dart';
import 'package:rustica/ui/atomic-design/tokens/Logos.dart';

class Registro extends StatefulWidget{
 @override
  RegistroState createState() => RegistroState();
}

class RegistroState extends State<Registro>{
   @override
   final _formKey = GlobalKey<FormState>();
   final txtcorreo = TextEditingController();
   final txtnombre = TextEditingController();
   final txttelefono = TextEditingController();

   Widget build(BuildContext context){
     return  Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        backgroundColor: ColoresApp.fondoNaranja,
      ),
       body: Container(
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
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 16.0),
                   ), //2
                 ],
               )),
         ),
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
           controller: txtcorreo,
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
                   Align(alignment: Alignment.center,),
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
                       onPressed: () {
                         // devolverá true si el formulario es válido, o falso si
                         // el formulario no es válido.
                         if (_formKey.currentState!.validate()) {
                           // Operaciones obj = new Operaciones();
                           // int num1= int.parse(txtNumero1.text);
                           // int num2 = int.parse(txtNumero2.text);
                           // String ope= valoroperacion;
                           // String mensaje = obj.CalcularProducto(num1, num2, ope);
                           // txtResultado.text = mensaje;
                           // Si el formulario es válido, queremos mostrar un Snackbar
                           Scaffold.of(context)
                               .showSnackBar(SnackBar(content: Text("ok")));
                         }
                       },
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