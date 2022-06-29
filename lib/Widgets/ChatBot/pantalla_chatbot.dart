
import 'package:flutter/material.dart';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';
import 'package:rustica/Widgets/get_chat_chatbot.dart';

class ChatBot extends StatefulWidget {
  @override
  ChatBotState createState() => ChatBotState();
  
}

class ChatBotState extends State<ChatBot> { 
  final TextEditingController txtControlerChat = TextEditingController();
  final DialogFlowtter txtControlerDialog = DialogFlowtter();
  final List<Map<String, dynamic>> chats = [];
  void enviarChat(String chat) async  {
    if (chat.isEmpty) return;
    setState(() {
      Message usuarioChat = Message(text: DialogText(text: [chat]));
      cargarChat(usuarioChat, true);
    });
    QueryInput consulta = QueryInput(text: TextInput(text:chat));//Creamos la consulta para el chatbot
    DetectIntentResponse  respuesta = await txtControlerDialog.detectIntent(queryInput: consulta);
    if (respuesta.message == null) return;
    setState(() {
      cargarChat(respuesta.message);
    });
  }
  void cargarChat(Message chat, [bool esmensajeUsuario = false]) {
    chats.add({
      'chat': chat,
      'esmensajeUsuario': esmensajeUsuario,
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
