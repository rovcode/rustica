// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rustica/ui/atomic-design/tokens/ColoresApp.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
class ChatBot extends StatefulWidget {
  @override
  ChatBotState createState() => ChatBotState();
  
}

class ChatBotState extends State<ChatBot> { 
  final TextEditingController txtControlerChat = TextEditingController();
  final List<Message> chats = [];
  void enviarChat(String chat) {
    if (chat.isEmpty) return;
    setState(() {
      Message userMessage = Message(text: DialogText(text: [chat]));
      chats.add(userMessage);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp.lightPrimary,
      appBar: AppBar(title: Text('ChatBot Rustica'),backgroundColor:ColoresApp.fondoNaranja ),
      body: Column(        
          children: [
          Expanded(
          child: ListaChats(arraychats: chats),
        ),         
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            color: ColoresApp.fondoNaranja,
            child: Row(
              children: [
                Expanded(
                  child: TextField(style: TextStyle(color: Colors.white),
                  controller: txtControlerChat,),
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String chats=txtControlerChat.text;
                    enviarChat(chats);
                    txtControlerChat.clear();
                    print("Ingeso teclado:"+chats);
                  },
                ),
              ],
            ), // Fin de la fila
          ), // Fin del contenedor
        ],
      ), // Fin de la columna
    );
  }
}

//=========================================================================
// MOSTRANTO CHATS
//=========================================================================
class ListaChats extends StatelessWidget {
  /// El componente recibirá una lista de mensajes
 final List<Message> arraychats;

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
        return Container(
          child: Text(arraychats[i].text?.text[0] ?? '',style: TextStyle(color: ColoresApp.darkPrimary),),
        );
      },
    );
  }
}