import 'package:flutter/material.dart';
import 'package:paymentez/paymentez.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';


class Pasarela extends StatefulWidget {

  @override
  PasarelaPageState createState() => PasarelaPageState();
}

class PasarelaPageState extends State<Pasarela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        backgroundColor: ColoresApp.fondoNaranja,
        title: Text("Pasarela de pago"),
      ),
      body: Container(
         color: ColoresApp.fondoNaranja,
         child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              elevation: 10,
              color: Colors.amber,
              child: Text('Agregar tarjeta'),
              onPressed: (){

                // showOtpPaymentez(
                //     context: context,
                //     btnColorBorderInput: Color(0xFFE7004C),
                //     btnColorFillInput: Colors.white,
                //     btnColorFocusInput: Color(0xFFE7004C),
                //     btnColorSend: Color(0xFFE7004C),
                //     btnTextCancel: "Cancelar",
                //     btnTextSend: "Enviar",
                //     colorTextInput: Colors.black45,
                //     textHintInput: "Ingrese su codigo",
                //     message: "Para realizar la validación si tu eres el propietario de la tarjeta, ingresa el valor de la transferencia que se ralizó a tu cuenta.",
                //     request: (String otp) {
                //       print(otp);
                //     });

              showDialogPaymentez(
                  context: context,
                  isDebug: true,
                  uid: 'ec774d32-8c3d-4df5-af5e-77e5177f4d1d',
                  email: 'user@softnux.io',
                  environment: 'stg', // stg -> developer or prod -> production
                  paymentClientAppCode: 'TPP3-EC-CLIENT',
                  paymentClientAppKey: 'ZfapAKOk4QFXheRNvndVib9XU3szzg',
                  background: 'F3F3F5',
                  btnBackground1: 'f02b6c',
                  btnBackground2: 'f02b6c',
                  textAddCard: 'Confirmar Pago',
                  textProcessingCard: 'Procesando tarjeta',
                  funReturnData: (DataModel data, controller) {
                    print(data);
                    switch (data.status) {
                      case 'success':
                        print('success card with paymentez');
                        print(data.cvc);

                        // metodo controller del web view para cerrar la ventana
                        controller.goBack();

                        // metodo para cerrar el Dialog
                        Navigator.of(context).pop();
                        break;

                      case 'pending' :
                        print('review card with paymentez');

                        print(data.cvc);

                        controller.goBack();
                        Navigator.of(context).pop();
                        break;

                      case 'failure':
                        print('failure card with paymentez');
                        controller.goBack();
                        Navigator.of(context).pop();
                        break;

                      case 'error':
                        print(data.error);
                        break;
                    }
                  }
              );
            },
            )
          ],
        ),
      ),
      ) ,
    );
  }
}