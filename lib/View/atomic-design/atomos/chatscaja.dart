import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:rustica/View/atomic-design/tokens/ColoresApp.dart';

class CajaChat extends StatelessWidget {
  final Message chat;
  final bool esmensajeUsuario;
  const CajaChat({
    required this.chat,
    this.esmensajeUsuario = false,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          esmensajeUsuario ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 250),
          child: Container(
            decoration: BoxDecoration(
              color: esmensajeUsuario ? ColoresApp.gris : Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              chat.text?.text[0] ?? '',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
