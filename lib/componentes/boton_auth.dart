import 'package:flutter/material.dart';

class BotonAuth extends StatelessWidget {
  const BotonAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 25),
      margin: EdgeInsets.all(25),
      child: const Text(
        "Login",
        style: TextStyle(
          color: Color.fromARGB(255, 230, 193, 139),
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 2,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 244, 111, 54),
      ),
    );
  }
}
