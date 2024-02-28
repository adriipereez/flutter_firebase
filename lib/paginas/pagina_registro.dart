import 'package:flutter/material.dart';
import 'package:flutter_firebase/componentes/boton_auth.dart';
import 'package:flutter_firebase/componentes/textfield_auth.dart';

class PaginaRegistro extends StatelessWidget {
  PaginaRegistro({super.key});

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerContrasena = TextEditingController();
  final TextEditingController controllerConfirmarContrasena = TextEditingController();

  void HacerRegistro() {
    
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
                          onTap: (){},
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
                    text: "LOGIN",
                    onTap: HacerRegistro,
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