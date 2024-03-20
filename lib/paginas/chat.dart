import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginaChat extends StatefulWidget {
  final String emailConQuienhablamos;
  const PaginaChat({
    super.key,
    required this.emailConQuienhablamos,
    });

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {

  final TextEditingController controllerMensaje = TextEditingController();

  void EnviarMensaje(){
    if(controllerMensaje.text.isNotEmpty){
      //Enviar el mensaje
      
      //Limpiar el campo
      controllerMensaje.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.emailConQuienhablamos),
      ),
      body: Column(
        children: [
          //Zona mensajes

          Expanded(
            child: _contruirlistaMensajes()
          ),

          //Zona escribir mensaje
          _contruirZonaInputUsuario(),

        ],
      ),
    );
  }

  Widget _contruirlistaMensajes(){
    return Container();
  }

  Widget _contruirZonaInputUsuario(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controllerMensaje,
              decoration: InputDecoration(
                fillColor: Colors.amber[100],
                filled: true,
                hintText: "Escribe el mensaje...",
              ),
              
            ),
          ),
          const SizedBox(width: 10,),
          IconButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)
            ),
          icon: Icon(Icons.send),
          color: Colors.pink,
          onPressed: EnviarMensaje, 
          ),
        ],
      ),
    );
  }
}
