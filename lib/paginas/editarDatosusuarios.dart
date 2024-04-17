import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase/auth/servicio_auth.dart';

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

      if (kIsWeb) {
        Uint8List archivoEnBytes = await image.readAsBytes();

        setState(() {
          _imagenSeleccionadaWeb = archivoEnBytes;
          _imagenAPuntoParaSubir = true;
        });
      }
    }
  }

  Future<bool> pujarImatgePerUsuari() async {
    String idUsuari = ServicioAuth().getUsuarioActual()!.uid;

    Reference ref =
        FirebaseStorage.instance.ref().child("$idUsuari/avatar/$idUsuari");

    // Agafem la imatge de la variable que la tingui (la de web o la de App).
    if (_imagenSeleccionadaApp != null) {
      try {
        await ref.putFile(_imagenSeleccionadaApp!);
        return true;
      } catch (e) {
        return false;
      }
    }

    if (_imagenSeleccionadaWeb != null) {
      try {
        await ref.putData(_imagenSeleccionadaWeb!);
        return true;
      } catch (e) {
        return false;
      }
    }

    return false;
  }

  Future<String> getImatgePerfil() async {
    final String idUsuari = ServicioAuth().getUsuarioActual()!.uid;
    final Reference ref =
        FirebaseStorage.instance.ref().child("$idUsuari/avatar/$idUsuari");

    final String urlImatge = await ref.getDownloadURL();

    return urlImatge;
  }

  Widget mostrarImatge() {
    return FutureBuilder(
      future: getImatgePerfil(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasError) {
          return const Icon(Icons.person);
        }

        return Image.network(
          snapshot.data!,
          errorBuilder: (context, error, stackTrace) {
            return Text("Error al carregar la imatge: $error");
          },
        );
      },
    );
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
              onTap: () async {
                if (_imagenAPuntoParaSubir) {
                  bool imatgePujadaCorrectament = await pujarImatgePerUsuari();

                  if (imatgePujadaCorrectament) {
                    mostrarImatge();
                    setState(() {});
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.purpleAccent),
                child: const Text("Sube una imagen"),
              ),
            ),
            // Visor del resultat del FilePicker.
            // ==================================
            Container(
              child: _imagenSeleccionadaWeb == null &&
                      _imagenSeleccionadaApp == null
                  ? Container()
                  : kIsWeb
                      ? Image.memory(
                          _imagenSeleccionadaWeb!,
                          fit: BoxFit.fill,
                        )
                      : Image.file(
                          _imagenSeleccionadaApp!,
                          fit: BoxFit.fill,
                        ),
            ),
            // Visor del resultado de cargar la imagen de Firebase Storage
            // ===========================================================
            Container(
              child: mostrarImatge(),
            ),
          ],
        ),
      )),
    );
  }
}
