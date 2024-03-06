import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/servicio_auth.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

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
    );
  }

  void logout() {
    final servicioAuth = ServicioAuth();
    servicioAuth.cerrarsesion();
  }
}