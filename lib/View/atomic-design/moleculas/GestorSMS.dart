import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rustica/Model/db/API-RSU.dart';
import 'package:rustica/Model/db/ServiceApiLogin.dart';
import 'package:rustica/View/Usuario/dashboard.dart';
import 'package:rustica/View/admin/DashboardAdmin.dart';
import 'package:rustica/View/atomic-design/atomos/ColoresApp.dart';
import 'package:rustica/View/atomic-design/atomos/Logos.dart';

import 'package:rustica/View/login_pw_page.dart';

import 'package:rustica/View/atomic-design/moleculas/GestorSMS.dart';

import 'package:rustica/View/pantalla_registro.dart';
import 'package:http/http.dart' as http;
import 'package:twilio_flutter/twilio_flutter.dart';

class GestorSMS extends StatefulWidget {
  @override
  GestorSMSState createState() => GestorSMSState();
}

class GestorSMSState extends State<GestorSMS> {
  @override
    Widget build(BuildContext context) {
      return Container();
      //sendSms('980866911','Rony');
    }
    Future<void> iniciandoservicio() async {
      sendSms('980866911','Rony');
    }



 //Enviando SMS al usuario
  late TwilioFlutter twilioFlutter;
  void initState() {
      iniciandoservicio();
      twilioFlutter =TwilioFlutter(accountSid: 'ACb959f96a62d836b9cd375cd7c991a3a6', authToken: '9ed5088b02beb7b530a4f7fa61f44009', twilioNumber: '+16107568190');
      super.initState();
    }
    void sendSms(String phone,String name) async {
      twilioFlutter.sendSMS(toNumber: '+51'+phone, messageBody: 'Hola '+name+' Rustica App RSU te da la bienvenida!');
    }

}