import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ServicioChat{
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getUsuaris(){
    return _firestore.collection("Usuarios").snapshots().map((event) {

      return event.docs.map((document) {

        final usuari = document.data();
        return usuari;

      }).toList();
    });
  }

}