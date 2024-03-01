import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/login_o_registro.dart';
import 'package:flutter_firebase/paginas/paagina_inicio.dart';

class PortalAuth extends StatelessWidget {
  const PortalAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          
          if(snapshot.hasData){
            return const PaginaInicio();
          } else {
            return const LoginORegistro();
          }
        }
      ),
    );
  }
}