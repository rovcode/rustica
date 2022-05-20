import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:rustica/ui/atomic-design/atomos/chatscaja.dart';
class ListaChats extends StatelessWidget {
  /// El componente recibirá una lista de mensajes
 final List<Map<String, dynamic>> arraychats;

  const ListaChats({
    this.arraychats = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: arraychats.length,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      separatorBuilder: (_, i) => const SizedBox(height: 10),
      itemBuilder: (context, i) {
        var obj = arraychats[arraychats.length - 1 - i];
        return CajaChat(
          chat: obj['chat'],
          esmensajeUsuario: obj['esmensajeUsuario'],
        );
        // return Container(
        //   child: Text(arraychats[i].text?.text[0] ?? '',style: TextStyle(color: ColoresApp.darkPrimary),),
        // );
      },
      reverse: true,
    );
  }
}