import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/login_o_registro.dart';
import 'package:flutter_firebase/auth/portal_auth.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:flutter_firebase/paginas/pagina_login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PortalAuth(),
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

4) Fer: dart pub global activate flutterfire_cli
5) Vincular proyecta local con el proyecto firebase de la consola.
    - flutterfire configure y seleccionamos el proyecto y que elegimos intsalar

6) Incluir las liobrerias de Firebase que queramos utilizar
    - flutter pub add firebase_core
    - flutter pub add firebase_auth
    - flutter pub add cloud_firestore
*/


/*
IMAGENES:

1) HabilitarFirebase Storage en el proyecto vinculado en Firebase.
  - Se puede poner las reglas en true el write i read

2) Descargamos dependencias de Firebase Storage al proyecto
  - flutter pub add firebase_storage

3) Descargamos una dependencia para seleccionar imagenes (un picker).
  - Hay varios
  - Usaremos el image_picker
    - flutter pub add image_picker

4) Para que funcione en Android:
  - Ir a android > app > src > main > AndroidMainfest.xml
    - Escribir justo antes del tag <aplication> (fuera del aplication)
    <uses-permission android:name="android.permision.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permision.READ_MEDIA_IMAGES"/>
    <uses-permission android:name="android.permision.READ_MEDIA_VIDEO"/>
*/