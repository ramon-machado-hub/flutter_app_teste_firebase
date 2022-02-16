import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/reserva.dart';
import 'package:flutter_app_teste_firebase/provider/reserva_provider.dart';
import 'package:provider/provider.dart';

class MinhasReservas extends StatefulWidget {
  @override
  _MinhasReservasState createState() => _MinhasReservasState();
}

class _MinhasReservasState extends State<MinhasReservas> {
  List<Reserva> items;
  StreamSubscription<QuerySnapshot> reservaInscricao;
  var db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = List();
    reservaInscricao?.cancel();
    reservaInscricao =
        db.collection("reserva").snapshots().listen((snapshot) {
          final List<Reserva> reserva = snapshot.docs
              .map((documentSnapshot) =>
              Reserva.fromMap(
                documentSnapshot.data(),
                documentSnapshot.id,),
          ).toList();
          setState(() {
            this.items = reserva;
          });
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    reservaInscricao?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final String idUsuario = ModalRoute.of(context).settings.arguments;
    final ReservaProvider reservaProvider = Provider.of<ReservaProvider>(
        context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Reservas'),

      ),
      body: Column(
        children: <Widget> [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              //filtrar por id proprietario
                stream: reservaProvider.getListReservaByProprietario(idUsuario),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return ListView(
                        children: snapshot.data.docs.map((DocumentSnapshot document) {
                          return ListTile(
                            leading: document.data()['situacao'] == 'PENDENTE' ? Icon(
                              Icons.swap_horizontal_circle_outlined,
                              color: Colors.black45,
                            ) : document.data()['situacao'] == 'ACEITOU' ? Icon(
                              Icons.check_circle,
                              color:  Colors.black45,
                            ) : Icon(
                              Icons.highlight_remove,
                              color:  Colors.black45,
                            ) ,
                            title: new Text('data: '+document.data()['data_reserva']),
                            subtitle: new Text('valor: '+document.data()['total']),
                            trailing: Container(
                              width: 50,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: (){
                                      Navigator.of(context).pushNamed('/detalhes_reserva', arguments:  Reserva(
                                        id: document.data()['id'],
                                        id_proprietario: document.data()['id_proprietario'],
                                        id_solicitante: document.data()['id_solicitante'],
                                        id_carro: document.data()['id_carro'],
                                        data_reserva: document.data()['data_reserva'],
                                        hora_entrada: document.data()['hora_entrada'],
                                        hora_saida: document.data()['hora_saida'],
                                        diaria: document.data()['diaria'],
                                        calcao: document.data()['calcao'],
                                        taxas_extras: document.data()['taxas_extras'],
                                        total: document.data()['total'],
                                        situacao: document.data()['situacao'],
                                        quilometragem: document.data()['quilometragem'],
                                        visualized: document.data()['visualized'],
                                      ));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                  } //switch
                } //builder
            ),
          ),
        ],
      ),
    );
  }
}
