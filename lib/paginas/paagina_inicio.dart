import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/servicio_auth.dart';
import 'package:flutter_firebase/chat/servicio_caht.dart';
import 'package:flutter_firebase/componentes/item_usuario.dart';
import 'package:flutter_firebase/paginas/chat.dart';

class PaginaInicio extends StatelessWidget {
  PaginaInicio({super.key});
final ServicioAuth _servicioAuth = ServicioAuth();
final ServicioChat _servicioChat = ServicioChat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Incio"),
        actions: [
          IconButton(
            onPressed: logout,
           icon: Icon(Icons.logout)
           ),
        ],
      ),
      body: _construirListaDeUsuarios(),
    );
  }
  Widget _construirListaDeUsuarios(){
    return StreamBuilder(
      stream: _servicioChat.getUsuaris(), 
      builder: (context, Snapshot) {
        //Mirar si hay error
        if(Snapshot.hasError){
          return const Text("Error");
        }
        //Esperar a que carguen los datos
        if(Snapshot.connectionState == ConnectionState.waiting){
          return const Text("Cargando datos...");
        }
        
        //Se retornan los datos
        return ListView(
          children: Snapshot.data!.map<Widget>((datosusuario) => _contruirItemUsuario(datosusuario, context)
          ).toList(),
        );
      }
    );
  }

  Widget _contruirItemUsuario(Map<String, dynamic> datosusuario, BuildContext context){

    if(datosusuario["email"] == _servicioAuth.getUsuarioActual()!.email){
      return Container();
    }
   return Itemusuario(
    emailUsuario: datosusuario['email'],
    Ontap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaChat(emailConQuienhablamos: datosusuario["email"],idReceptor: datosusuario["uid"],)));
    },
    );
  }


  void logout() {
    _servicioAuth.cerrarsesion();
  }
}