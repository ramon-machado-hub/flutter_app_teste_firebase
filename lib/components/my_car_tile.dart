import 'package:flutter_app_teste_firebase/models/car.dart';
import 'package:flutter/material.dart';

class MyCarTile extends StatelessWidget {
  final Car car;

  const MyCarTile(this.car);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        //print(car.foto_url);
        car.foto_url,
        width: 100,
        height: 100,
        fit: BoxFit.fill,
      ),
      title: Text(
        car.modelo,
          style: TextStyle(
            fontSize: 16,
            color: Colors.amberAccent[300],
          ),
        ),
      subtitle: Text(
        'Valor: ' + car.diaria,
        style: TextStyle(fontSize: 12, color: Colors.amberAccent[300]),
      ),
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
  }
}
