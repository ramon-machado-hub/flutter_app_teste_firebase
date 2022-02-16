import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_teste_firebase/models/car.dart';
import 'package:flutter_app_teste_firebase/provider/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/components/my_car_tile.dart';
import 'package:provider/provider.dart';

class ListMyCars extends StatefulWidget {
  @override
  _ListMyCarsState createState() => _ListMyCarsState();
}

class _ListMyCarsState extends State<ListMyCars> {
  List<Car> items;
  StreamSubscription<QuerySnapshot> carInscricao;
  var db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = List();
    carInscricao?.cancel();
    carInscricao =
        db.collection("cars").snapshots().listen((snapshot) {
          final List<Car> cars = snapshot.docs
              .map((documentSnapshot) =>
              Car.fromMap(
                documentSnapshot.data(),
                documentSnapshot.id,),
          ).toList();
          setState(() {
            this.items = cars;
          });
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    carInscricao?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String idUsuario = ModalRoute.of(context).settings.arguments;
    final CarProvider carProvider = Provider.of<CarProvider>(
        context, listen: false);
    //final Car car = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Carros'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('/cadastro_carro', arguments: idUsuario);
              }
          )
        ],
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              //filtrar por id proprietario
                stream: carProvider.getListCarByProprietario(idUsuario),
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
                            leading: Image.network(
                              document.data()['foto_url'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                            title: new Text(document.data()['marca']),
                            subtitle: new Text(document.data()['modelo']),
                            trailing: Container(
                              width: 50,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: (){
                                      Navigator.of(context).pushNamed('/cadastro_carro');
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

/* carProvider.put(Car(
                    quilometragem: '10000',
                    placa:'AOA4455',
                    modelo: 'COROLA',
                    marca: 'TOYOTA',
                    foto_url: 'https://cdn.motor1.com/images/mgl/WRMWr/s1/toyota-corolla-gli-2020.jpg',
                    diaria: '250,00',
                    cor: 'PRATA',
                    calcao: '100,00',
                    ano: '2019',
                    id_proprietario: '1',
                    id: (carProvider.count+1).toString(),

                  ));*/