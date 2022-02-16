import 'package:flutter/cupertino.dart';
import 'package:flutter_app_teste_firebase/models/reserva.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ReservaProvider with ChangeNotifier {
  var db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getListReservaByProprietario(String i) {
    return db.collection("reserva")
        .where('id_proprietario', isEqualTo: i)
        .snapshots();
  }


  Future<int> getCount() async{
    QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('reserva').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    return _myDocCount.length;
  }

  int count() {
    int count = int.parse(getCount().toString());
    return count;
  }

  Stream<QueryDocumentSnapshot> getReservaById(String id){
    return db.collection('reserva').doc(id).snapshots();
  }



  Stream<QuerySnapshot> getListReservaBySolicitante(String i){
    return db.collection("reserva")
        .where('id_solicitante', isEqualTo: i)
        .snapshots();
  }

  Future<void> put(Reserva reserva) async {
    if (reserva.id == null){
      print('entrou');
      int id = await getCount();
      db.collection('reserva').doc((id+1).toString()).set({
        'id': (id+1).toString(),
        'id_proprietario': reserva.id_proprietario,
        'id_solicitante': reserva.id_solicitante,
        'id_carro': reserva.id_carro,
        'diaria': reserva.diaria,
        'calcao': reserva.calcao,
        'taxas_extras': reserva.taxas_extras,
        'total': reserva.total,
        'quilometragem': reserva.quilometragem,
        'data_reserva': reserva.data_reserva,
        'hora_entrada': reserva.hora_entrada,
        'hora_saida': reserva.hora_saida,
        'situacao': reserva.situacao,
        'visualized': false,
      });
    }else {

      db.collection('reserva').doc(reserva.id).set({
        'id': reserva.id,
        'id_proprietario': reserva.id_proprietario,
        'id_solicitante': reserva.id_solicitante,
        'id_carro': reserva.id_carro,
        'diaria': reserva.diaria,
        'calcao': reserva.calcao,
        'taxas_extras': reserva.taxas_extras,
        'total': reserva.total,
        'quilometragem': reserva.quilometragem,
        'data_reserva': reserva.data_reserva,
        'hora_entrada': reserva.hora_entrada,
        'hora_saida': reserva.hora_saida,
        'situacao': reserva.situacao,
        'visualized': true,
        'situacao': reserva.situacao,
        'visible': true,
      });
    }
  }
}