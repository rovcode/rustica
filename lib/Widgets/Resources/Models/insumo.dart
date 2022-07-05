import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rustica/Usuarios/ui/screen/dashboard.dart';
import 'package:rustica/Usuarios/ui/screen/pantalla_login.dart';
import 'package:rustica/Usuarios/model/User.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:rustica/Usuarios/repository/API-RSU.dart';
import 'package:rustica/Widgets/Resources/moleculas/gestor_menu_app.dart';



class Insumo extends StatelessWidget{
  final Usuario data;
  Insumo({required this.data});

  
  @override
  Widget build (BuildContext context){
    return Scaffold (
      body: Stack(

        children: [
          FadeInImage(
              fit: BoxFit.cover,
              height: double.infinity,
              placeholder: NetworkImage('https://scontent.flim13-1.fna.fbcdn.net/v/t31.18172-8/21765780_1811881862185768_695814991271747917_o.jpg?stp=cp0_dst-jpg_e15_fr_q65&_nc_cat=111&ccb=1-7&_nc_sid=e007fa&efg=eyJpIjoidCJ9&_nc_eui2=AeE6D4rvZ3bpzfePOPuzqlhywBPeM26u4lTAE94zbq7iVGlKj0DbWPNr--lhd5I2T3oSKjQZDbO6mQqK6o78k0uN&_nc_ohc=J1IM7mA2a9AAX-kI0Ji&tn=PPVZ5n4mI8twmQ0M&_nc_ht=scontent.flim13-1.fna&oh=00_AT9y50mCiV6A2XF5OFhm_7LOG_qYi1KjTCln5OK74uBgpQ&oe=62E33D26'),
              image: NetworkImage('https://scontent.flim13-1.fna.fbcdn.net/v/t31.18172-8/21765780_1811881862185768_695814991271747917_o.jpg?stp=cp0_dst-jpg_e15_fr_q65&_nc_cat=111&ccb=1-7&_nc_sid=e007fa&efg=eyJpIjoidCJ9&_nc_eui2=AeE6D4rvZ3bpzfePOPuzqlhywBPeM26u4lTAE94zbq7iVGlKj0DbWPNr--lhd5I2T3oSKjQZDbO6mQqK6o78k0uN&_nc_ohc=J1IM7mA2a9AAX-kI0Ji&tn=PPVZ5n4mI8twmQ0M&_nc_ht=scontent.flim13-1.fna&oh=00_AT9y50mCiV6A2XF5OFhm_7LOG_qYi1KjTCln5OK74uBgpQ&oe=62E33D26')),
          Container(
            alignment: AlignmentDirectional.topStart,
            margin: EdgeInsets.only(top: 50.0, left: 10.0),
            child: GestureDetector(
              onTap: () =>{Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(data:data) ))   },
              child: Icon(
                  Icons.chevron_left,
                  color: Colors.orange,
                  size: 40.0
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(0.0, 500),
              child:_cardProfileInfo()
          )
        ],
      ),
    );
  }

}

Widget _cardProfileInfo(){
  return Container (
    margin: EdgeInsets.symmetric(horizontal: 20.0),
    padding: EdgeInsets.all(20.0),
    height: 320,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _socialButtons(),
        SizedBox(height: 6.0),
        _headers('Rustica', Colors.black, 24.0),
        SizedBox(height: 4.0),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
              'Somos Rustica y te ofrecemos una amplia carta de'
                  ' platos, piqueos y bebidas. Puedes visitarnos en '
                  'nuestros locales o realiza tu pedido y nosotros te lo'
                  ' llevamos a casa.',
              style: TextStyle(
                  color: Color.fromRGBO(42, 44, 49, 1.0),
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0)),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
              'Tenemos 30 años en el mercado, siendo una '
                  'de las franquicias peruanas en el rubro de '
                  'restaurantes y entretenimiento con mayor '
                  'crecimiento en los últimos años',
              style: TextStyle(
                  color: Color.fromRGBO(42, 44, 49, 1.0),
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0)),
        ),
      ],
    ),
  );
}

Widget _socialButtons() {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(
            'https://scontent.flim13-1.fna.fbcdn.net/v/t31.18172-8/21765780_1811881862185768_695814991271747917_o.jpg?stp=cp0_dst-jpg_e15_fr_q65&_nc_cat=111&ccb=1-7&_nc_sid=e007fa&efg=eyJpIjoidCJ9&_nc_eui2=AeE6D4rvZ3bpzfePOPuzqlhywBPeM26u4lTAE94zbq7iVGlKj0DbWPNr--lhd5I2T3oSKjQZDbO6mQqK6o78k0uN&_nc_ohc=J1IM7mA2a9AAX-kI0Ji&tn=PPVZ5n4mI8twmQ0M&_nc_ht=scontent.flim13-1.fna&oh=00_AT9y50mCiV6A2XF5OFhm_7LOG_qYi1KjTCln5OK74uBgpQ&oe=62E33D26'),
        radius: 40.0,
      ),
      Transform.translate(
        offset: Offset(-20.0, 30.0),
        child: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      ),
      Spacer(),
      Container(
        margin: EdgeInsets.only(right: 10.0),
        child: RaisedButton(
          onPressed: (){
            launch("https://www.facebook.com/rusticaperu/");},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: Colors.white,
          child: Text('Facebook', style: TextStyle(color: Colors.black)),
        ),
      ),
      RaisedButton(
        onPressed: (){
          launch("https://www.instagram.com/rusticaperu/");},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Color.fromRGBO(245, 45, 86, 1.0),
        child: Text('Instagram', style: TextStyle(color: Colors.white)),
      )
    ],
  );
}
Widget _headers(String texto, Color color, double fontSize){
  return Text ( texto,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: fontSize));
}

