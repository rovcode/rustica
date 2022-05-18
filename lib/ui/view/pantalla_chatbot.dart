import 'package:flutter/material.dart';
import 'package:rustica/ui/atomic-design/tokens/ColoresApp.dart';
class ChatBot extends StatefulWidget {
  @override
  ChatBotState createState() => ChatBotState();
}

class ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp.lightPrimary,
      appBar: AppBar(title: Text('ChatBot Rustica'),backgroundColor:ColoresApp.fondoNaranja ),
      body: Column(
        
        children: [
          /// Esta parte se asegura que la caja de texto se posicione hasta abajo de la pantalla
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            color: ColoresApp.fondoNaranja,
            child: Row(
              children: [
                /// El Widget [Expanded] se asegura que el campo de texto ocupe
                /// toda la pantalla menos el ancho del [IconButton]
                Expanded(
                  child: TextField(style: TextStyle(color: Colors.white)),
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ), // Fin de la fila
          ), // Fin del contenedor
        ],
      ), // Fin de la columna
    );
  }
}
