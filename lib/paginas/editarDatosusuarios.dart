import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class EditarDatosUsuario extends StatefulWidget {
  const EditarDatosUsuario({super.key});

  @override
  State<EditarDatosUsuario> createState() => _EditarDatosUsuarioState();
}

class _EditarDatosUsuarioState extends State<EditarDatosUsuario> {
  File? _imagenSeleccionadaApp;
  Uint8List? _imagenSeleccionadaWeb;
  bool _imagenAPuntoParaSubir = false;

  Future<void> _escogeImagen() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    //Si escogemos imagenn y la encontramos
    if (image != null) {
      //Si la App se ejecuta en un dispositivo movil
      if (!kIsWeb) {
        File archivoSeleccionado = File(image.path);

        setState(() {
          _imagenSeleccionadaApp = archivoSeleccionado;
          _imagenAPuntoParaSubir = true;
        });
      }

     if(kIsWeb){
        Uint8List archivoEnBytes = await image.readAsBytes();

        setState(() {
          
          _imagenSeleccionadaWeb = archivoEnBytes;
          _imagenAPuntoParaSubir = true;
        });
     }


    }

      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar datos"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Boton para abrir el FilePicker.
            // ===============================
            GestureDetector(
              onTap: _escogeImagen,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.purpleAccent),
                child: const Text("Escoge una imagen"),
              ),
            ),
            // Boton para subir la imagen seleccionada con FilePicker
            // ======================================================
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.purpleAccent),
                child: const Text("Sube una imagen"),
              ),
            )
            // Visor del resultado de cargar la imagen de Firebase Storage
            // ===========================================================
          ],
        ),
      )),
    );
  }
}
