import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginaChat extends StatefulWidget {
  const PaginaChat({super.key});

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Con quien hablamos"),
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
    return Container();
  }
}
