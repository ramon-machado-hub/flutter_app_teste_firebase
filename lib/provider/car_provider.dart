import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/car.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class CarProvider with ChangeNotifier {


  var db = FirebaseFirestore.instance;

  Future<int> getCount() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('cars')
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    return _myDocCount.length;
  }

  int count() {
    int count = int.parse(getCount().toString());
    return count;
  }




  Stream<QueryDocumentSnapshot> getCarById(String id) {
    return db.collection('cars').doc(id).snapshots();
  }

  Stream<QuerySnapshot> getListCar() {
    return db.collection('cars').snapshots();
  }

  Stream<QuerySnapshot> getListCarByProprietario(String i) {
    return db.collection("cars")
        .where('id_proprietario', isEqualTo: i)
        .snapshots();
  }

  void remove(BuildContext context, DocumentSnapshot doc, int position) async {
    db.collection("car").doc(doc.id).delete();
    notifyListeners();
  }

  Future<void> put(Car car) async {
    //print(car.id);
    if (car.id == null) {
      //print('entrou');
      int id = await getCount();
      db.collection('cars').doc((id + 1).toString()).set({
        'id': (id + 1).toString(),
        'quilometragem': car.quilometragem,
        'placa': car.placa,
        'modelo': car.modelo,
        'marca': car.marca,
        'foto_url': car.foto_url,
        'diaria': car.diaria,
        'cor': car.cor,
        'calcao': car.calcao,
        'ano': car.ano,
        'id_proprietario': car.id_proprietario,
      });
    } else {
      db.collection('cars').doc(car.id).set({
        'quilometragem': car.quilometragem,
        'placa': car.placa,
        'modelo': car.modelo,
        'marca': car.marca,
        'foto_url': car.foto_url,
        'diaria': car.diaria,
        'cor': car.cor,
        'calcao': car.calcao,
        'ano': car.ano,
        'id_proprietario': car.id_proprietario,
      }
      );
    }
  }
}