import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/servicio_auth.dart';
import 'package:flutter_firebase/componentes/boton_auth.dart';
import 'package:flutter_firebase/componentes/textfield_auth.dart';

class PaginaRegistro extends StatefulWidget {

  final void Function() alHacerClick;

  PaginaRegistro({super.key, required this.alHacerClick});

  @override
  State<PaginaRegistro> createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerContrasena = TextEditingController();

  final TextEditingController controllerConfirmarContrasena = TextEditingController();

  void HacerRegistro(BuildContext context) async {
    final servicioAuth = ServicioAuth();
    try {
      servicioAuth.RegistroConEmailPassword(controllerEmail.text, controllerContrasena.text);
    } catch (e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: const Text("ERROR"),
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 183, 159),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //LOGO
                  const Icon(
                   Icons.fireplace,
                   size: 120,
                   color: Color.fromARGB(255, 255, 240, 218 ), 
                  ),
                  const SizedBox(height: 10,),
                  //FRASE
                  const Text(
                    "Crea una cuenta",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 240, 218),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25,),
                  //Text divisori
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "REGISTRATE",
                            style: TextStyle(color: Color.fromARGB(255, 255, 250, 218),),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //TextField Email
                  TextFieldAuth(controller: controllerEmail, obscureText: false, hintText: "Email"),
                  //TextField Password
                  TextFieldAuth(controller: controllerContrasena, obscureText: true, hintText: "Password"),
                  const SizedBox(height: 10,),
                  //No estas registrado
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("¿Ya eres miembro?"),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: widget.alHacerClick,
                          child: const Text("Logueate",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 44, 174, 255),
                          ),),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //Boton login
                  BotonAuth(
                    text: "REGISTRO",
                    onTap: () => HacerRegistro(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}