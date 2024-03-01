import 'package:flutter/material.dart';

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
    
  }
}