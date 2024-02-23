import 'package:flutter/material.dart';
import 'package:flutter_firebase/paginas/pagina_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Paginalogin(),
      debugShowCheckedModeBanner: false ,
    );
  }
}

/*
1) Tener el Node.js instalado
2) npm install -g firebase-tools
3) Hacer login el Firebase: firebase login 
    - Si da error del archivo firebase.ps1, entramos en la ruta y cambiamos nombre
    - Si volemos a hacer login, nos dice que en que cuenta estanmos
    - Si quisieramos cambiar de cuenta, hacemos fireabse logout
*/