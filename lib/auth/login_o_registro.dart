import 'package:flutter/material.dart';
import 'package:flutter_firebase/paginas/pagina_login.dart';
import 'package:flutter_firebase/paginas/pagina_registro.dart';

class LoginORegistro extends StatefulWidget {

  const LoginORegistro({super.key});

  @override
  State<LoginORegistro> createState() => _LoginORegistroState();
}

class _LoginORegistroState extends State<LoginORegistro> {
  bool muestraPaginaLogin = true;

  void IntercambiarPaginasLoginRegistro() {
    setState(() {
      muestraPaginaLogin = !muestraPaginaLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (muestraPaginaLogin) {
      return Paginalogin(alHacerClick: IntercambiarPaginasLoginRegistro,);
    } else {
      return PaginaRegistro(alHacerClick: IntercambiarPaginasLoginRegistro,);
    }
  }
}
