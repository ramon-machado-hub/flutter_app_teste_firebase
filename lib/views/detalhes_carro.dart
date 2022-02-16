import 'package:flutter/material.dart';
import 'package:flutter_app_teste_firebase/models/car.dart';


class DetalhesCarro extends StatefulWidget {

  @override
  _DetalhesCarroState createState() => _DetalhesCarroState();
}



class _DetalhesCarroState extends State<DetalhesCarro> {
  @override
  Widget build(BuildContext context) {
    final Car car = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Detalhes Veículo')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                car.foto_url,
                height: 200,
                //width: MediaQuery.of(context).size.width ,
                fit: BoxFit.fill,

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 0, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        car.marca,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(car.modelo,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text(car.ano,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Limite de quilometragem: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text(car.quilometragem+" km",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
           // SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 0, bottom: 0),
              child: Divider(
                  color: Colors.black45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Diária a partir de',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  Text(car.diaria+',00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('(Mais taxas de cobertura)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 240,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.blue[900],
                onPressed: ((){
                  Navigator.of(context).pushNamed('/solicitar_reserva',arguments: car);
                }),
                child: Text('Solicitar reserva', style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
                elevation: 4.0,
                splashColor: Colors.blue[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
