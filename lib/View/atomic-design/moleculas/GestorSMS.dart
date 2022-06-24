import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class GestorSMS extends StatefulWidget {
  final String numerocliente;
  // ignore: use_key_in_widget_constructors
  GestorSMS({required this.numerocliente});
  @override
  // ignore: no_logic_in_create_state
  GestorSMSState createState() => GestorSMSState(numerocliente:numerocliente);
}
class GestorSMSState extends State<GestorSMS>{
 final String numerocliente;
 GestorSMSState({required this.numerocliente});
 late TwilioFlutter twilioFlutter;
 void initState() {
    twilioFlutter =TwilioFlutter(accountSid: 'ACb959f96a62d836b9cd375cd7c991a3a6', authToken: '9ed5088b02beb7b530a4f7fa61f44009', twilioNumber: '+16107568190');

    super.initState();
    sendSms();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(toNumber: numerocliente, messageBody: 'Prueba de app rustica');
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}