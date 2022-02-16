import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_teste_firebase/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/users.dart';
import 'package:flutter_app_teste_firebase/provider/car_provider.dart';
import 'package:flutter_app_teste_firebase/provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../components/drawer.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _HomePageState();

  Car car;
  List<Car> items;
  StreamSubscription<QuerySnapshot> carInscricao;
  var db = FirebaseFirestore.instance;



  //var Users usuario =;
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
    final CarProvider carProvider = Provider.of<CarProvider>(
        context, listen: false);
    final Users usuario = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      drawer: IsDrawer(user: usuario,),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Veiculos disponíveis'),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list_rounded),
              onPressed: () {
                //Navigator.of(context).pushNamed('/cadastro_carro', arguments: idUsuario);
              }
          )
        ],
      ),
      body: Container(
        color: Colors.white38,
        width:  double.infinity,
        height:  double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: carProvider.getListCar(),
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
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: Card(
                                elevation: 20,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/detalhes_carro',
                                        arguments:  Car(
                                          id: document.data()['id'],
                                          id_proprietario: document.data()['id_proprietario'],
                                          placa: document.data()['placa'],
                                          cor: document.data()['cor'],
                                          modelo: document.data()['modelo'],
                                          marca: document.data()['marca'],
                                          quilometragem: document.data()['quilometragem'],
                                          ano: document.data()['ano'],
                                          calcao: document.data()['calcao'],
                                          diaria: document.data()['diaria'],
                                          foto_url: document.data()['foto_url'],
                                        ));
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            child: Image.network(
                                              document.data()['foto_url'],
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.fill,

                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: Container(
                                              child: Center(
                                                child: Text('a partir de R\$ '+document.data()['diaria']+',00/ dia',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,

                                                  ),
                                                ),
                                              ),
                                              width: 165,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: const Radius.circular(5.0),
                                                  topRight: const Radius.circular(5.0),
                                                  bottomLeft:   const Radius.circular(5.0),
                                                  bottomRight: const Radius.circular(5.0),
                                                ),
                                                //shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(height: 3,),
                                          Text(' '+
                                              document.data()['marca'],
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(' '+
                                              document.data()['modelo'],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.amberAccent[300],
                                            ),
                                          ),

                                          Text(
                                            document.data()['ano']+'   ',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
      ),
    );
  }


}