import 'package:flutter/material.dart';

class BotonAuth extends StatelessWidget {

  final String text;
  final Function()? onTap;

  BotonAuth({
    super.key,
    required this.text,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 25),
        margin: EdgeInsets.all(25),
        child: Text(
          text,
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
      ),
    );
  }
}
