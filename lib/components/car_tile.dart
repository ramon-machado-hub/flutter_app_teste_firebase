import 'package:flutter_app_teste_firebase/models/car.dart';
import 'package:flutter/material.dart';

class CarTile extends StatelessWidget {
  final Car car;

  const CarTile(this.car);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 20,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/detalhes_carro',arguments: car);
            },
            child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                      child: Image.network(
                        car.foto_url,
                        height: 200,
                        //width: MediaQuery.of(context).size.width ,
                        fit: BoxFit.fill,

                      ),
                    ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(

                          child: Center(
                            child: Text('a partir de R\$ '+car.diaria+'/ dia',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,

                              ),
                            ),
                          ),
                          width: 135,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(5.0),
                                topRight: const Radius.circular(5.0),                              ),
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
                          car.marca,
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
                          car.modelo,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent[300],
                        ),
                      ),

                      Text(
                          car.ano+'   ',
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
  }
}
